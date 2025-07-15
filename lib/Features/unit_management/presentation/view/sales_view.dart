import 'package:book_apartment_dashboard/core/widgets/custom_data_cell.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_header_call.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_pagination.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_properties/presentation/view/requests_to_add_new_properties.dart';
import '../../../add_new_properties/presentation/view/widgets/tabs.dart';
import '../../data/models/property_model.dart';
import '../../data/repo/property_repo_impl.dart';
import '../cubit/property_cubit.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  final int rowsPerPage = 10;

  int currentPage = 1;
  List<PropertyModel> _lastProperties = [];
  num _lastTotalCount = 0;

  int selectedTabIndex = 0;
  String? selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = '';
    _fetchPage(currentPage);
  }

  void _onPageChanged(int page) {
    if (!mounted) return;
    setState(() => currentPage = page);
    _fetchPage(page);
  }

  void _fetchPage(int page) {
    if (!mounted) return;
    context.read<PropertyCubit>().fetchProperties(
      propertyType: 'Sale',
      pageNumber: page,
      pageSize: rowsPerPage,
      propertySaleStatus: selectedStatus ?? '',
      propertyRentStatus: '',
    );
  }

  String _mapStatusToApi(String status) {
    final mapping = {
      S.of(context).availableShort: 'Available',
      S.of(context).pendingShort: 'Waiting_for_reply',
      S.of(context).underInspectionShort: 'UnderReview',
      S.of(context).soldShort: 'Sold',
    };
    return mapping[status] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      S.of(context).allUnits('1,500'),
      S.of(context).available('500'),
      S.of(context).pending1('100'),
      S.of(context).underInspection('100'),
      S.of(context).sold('800'),
    ];
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Tabs(
            tabs: tabs,
            selectedIndex: selectedTabIndex,
            onTabSelected: (i) {
              setState(() {
                selectedTabIndex = i;
                currentPage = 1;
                selectedStatus = i == 0
                    ? ''
                    : i == 1
                    ? 'Available'
                    : i == 2
                    ? 'Waiting_for_reply'
                    : i == 3
                    ? 'UnderReview'
                    : 'Sold';
              });
              context.read<PropertyCubit>().fetchProperties(
                propertyType: 'Sale',
                pageNumber: currentPage,
                pageSize: rowsPerPage,
                propertySaleStatus: selectedStatus!,
                propertyRentStatus: '',
              );
            },
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: BlocConsumer<PropertyCubit, PropertyState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return BlocBuilder<PropertyCubit, PropertyState>(
                  buildWhen: (previous, current) =>
                  current is PropertyLoading ||
                      current is PropertyError ||
                      current is PropertyLoaded,
                  builder: (context, state) {
                    if (state is PropertyLoading) {
                      return CustomLoading();
                    }
                    if (state is PropertyError) {
                      return Center(child: Text(state.message));
                    }
                    if (state is PropertyLoaded) {
                      _lastProperties = state.properties;
                      _lastTotalCount = _lastProperties.isNotEmpty
                          ? _lastProperties[0].totalCount
                          : 0;
                      final properties = _lastProperties;
                      final totalCount = _lastTotalCount;
                      final pageCount = (totalCount / rowsPerPage).ceil();

                      // حساب نطاق العناصر للصفحة الحالية
                      final startIndex = (currentPage - 1) * rowsPerPage;
                      final endIndex = startIndex + rowsPerPage;
                      final paginatedData = properties.isNotEmpty
                          ? properties[0].data.sublist(
                        startIndex,
                        endIndex > properties[0].data.length
                            ? properties[0].data.length
                            : endIndex,
                      )
                          : [];

                      return Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Table(
                                border: TableBorder.all(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.graysGray2,
                                ),
                                columnWidths: const {
                                  0: FlexColumnWidth(1.5),
                                  1: FlexColumnWidth(1.5),
                                  2: FlexColumnWidth(1.5),
                                  3: FlexColumnWidth(1.5),
                                  4: FlexColumnWidth(1.5),
                                  5: FlexColumnWidth(1.8),
                                },
                                children: [
                                  TableRow(
                                    decoration: BoxDecoration(color: Colors.transparent),
                                    children: [
                                      CustomHeaderCall(
                                        text: S.of(context).unitType,
                                        context: context,
                                      ),
                                      CustomHeaderCall(
                                        text: S.of(context).governorate,
                                        context: context,
                                      ),
                                      CustomHeaderCall(
                                        text: S.of(context).addedDate,
                                        context: context,
                                      ),
                                      CustomHeaderCall(
                                        text: S.of(context).ownerName,
                                        context: context,
                                      ),
                                      CustomHeaderCall(
                                        text: S.of(context).status,
                                        context: context,
                                      ),
                                      CustomHeaderCall(
                                        text: S.of(context).actions,
                                        context: context,
                                      ),
                                    ],
                                  ),
                                  if (properties.isNotEmpty)
                                    ...List.generate(paginatedData.length, (index) {
                                      final property = paginatedData[index];
                                      return TableRow(
                                        children: [
                                          CustomDataCell(
                                            text: property.id.toString(),
                                            context: context,
                                          ),
                                          CustomDataCell(
                                            text: property.governorate,
                                            context: context,
                                          ),
                                          CustomDataCell(
                                            text: property.createdAt,
                                            context: context,
                                          ),
                                          CustomDataCell(
                                            text: property.ownerName,
                                            context: context,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 8.0,
                                              horizontal: 12,
                                            ),
                                            child: DropdownButton<String>(
                                              icon: const Icon(Icons.arrow_drop_down),
                                              iconSize: 24,
                                              underline: Container(color: Colors.transparent),
                                              items: [
                                                DropdownMenuItem(
                                                  value: 'Available',
                                                  child: Text(
                                                    S.of(context).availableShort,
                                                    style: AppTextStyles.text14pxRegular(
                                                      context,
                                                    ),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: 'Waiting_for_reply',
                                                  child: Text(
                                                    S.of(context).pendingShort,
                                                    style: AppTextStyles.text14pxRegular(
                                                      context,
                                                    ),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: 'UnderReview',
                                                  child: Text(
                                                    S.of(context).underInspectionShort,
                                                    style: AppTextStyles.text14pxRegular(
                                                      context,
                                                    ),
                                                  ),
                                                ),
                                                DropdownMenuItem(
                                                  value: 'Sold',
                                                  child: Text(
                                                    S.of(context).soldShort,
                                                    style: AppTextStyles.text14pxRegular(
                                                      context,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                              onChanged: (value) {
                                                if (value != null) {
                                                  setState(() {
                                                    selectedStatus = value;
                                                  });
                                                  context.read<PropertyCubit>().fetchProperties(
                                                    propertyType: 'Sale',
                                                    pageNumber: currentPage,
                                                    pageSize: rowsPerPage,
                                                    propertySaleStatus: value,
                                                    propertyRentStatus: '',
                                                  );
                                                }
                                              },
                                              value: property.propertySaleStatus,
                                            ),
                                          ),
                                          ActionCell(
                                            index: startIndex + index,
                                            isView: true,
                                            onDelete: () {},
                                            onView: () {},
                                            iDark: isDark,
                                          ),
                                        ],
                                      );
                                    }),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          CustomPagination(
                            currentPage: currentPage,
                            pageCount: pageCount,
                            onPageChanged: _onPageChanged,
                          ),
                        ],
                      );
                    }
                    return const SizedBox.shrink();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ActionCell extends StatelessWidget {
  final int index;
  final bool isView;
  final bool iDark;
  final VoidCallback onDelete;
  final VoidCallback onView;

  const ActionCell({
    super.key,
    required this.index,
    this.isView = false,
    required this.onDelete,
    required this.onView,
    required this.iDark,
  });

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                Assets.imagesHugeiconsView,
                color: iDark
                    ? AppColors.darkModeAccent
                    : AppColors.lightModeAccent,
              ),
            ),
            SvgPicture.asset(
              Assets.imagesBasilEditOutline,
              color: iDark
                  ? AppColors.darkModeAccent
                  : AppColors.lightModeAccent,
            ),
            SvgPicture.asset(Assets.imagesFluentDelete32Regular),
          ],
        ),
      ),
    );
  }
}