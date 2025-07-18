import 'package:book_apartment_dashboard/constant.dart';
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
import '../../../add_new_properties/presentation/view/widgets/tabs.dart';
import '../../data/models/property_model.dart';
import '../cubit/property_cubit.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  final int rowsPerPage = 10;
  int currentPage = 1;
  int selectedTabIndex = 0;
  String? selectedStatus;
  PropertyModel? _lastProperties;
  num _lastTotalCount = 0;

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
    logger.i('Page changed to: $page');
  }

  void _fetchPage(int page) {
    if (!mounted) return;
    logger.i('Fetching page: $page with status: $selectedStatus');
    context.read<PropertyCubit>().fetchProperties(
      propertyType: 'Sale',
      pageNumber: page,
      pageSize: rowsPerPage,
      propertySaleStatus: selectedStatus ?? '',
      propertyRentStatus: '',
    );
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

    return BlocListener<PropertyCubit, PropertyState>(
      listener: (context, state) {
        if (state is PropertyError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
          setState(() {
            _lastProperties = null;
            _lastTotalCount = 0;
          });
        } else if (state is PropertyLoaded) {
          logger.i(
            'Loaded page: ${state.properties.pageNumber}, total: ${state.properties.totalCount}',
          );
        }
      },
      child: Padding(
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
                  currentPage = 1; // إعادة الصفحة إلى 1 عند تغيير التبويب
                  selectedStatus =
                      i == 0
                          ? ''
                          : i == 1
                          ? 'Available'
                          : i == 2
                          ? 'Waiting_for_reply'
                          : i == 3
                          ? 'UnderReview'
                          : 'Sold';
                });
                _fetchPage(currentPage);
              },
              isDark: isDark,
            ),
            const SizedBox(height: 16),
            Expanded(child: buildTableWithPagination()),
          ],
        ),
      ),
    );
  }

  Widget buildTableWithPagination() {
    return BlocBuilder<PropertyCubit, PropertyState>(
      buildWhen:
          (previous, current) =>
              current is PropertyLoading ||
              current is PropertyError ||
              current is PropertyLoaded,
      builder: (context, state) {
        if (state is PropertyLoading) return const CustomLoading();
        if (state is PropertyError) {
          return Center(
            child: Text(
              state.message,
              style: AppTextStyles.text14pxRegular(
                context,
              ).copyWith(color: Colors.red),
            ),
          );
        }
        if (state is PropertyLoaded) {
          _lastProperties = state.properties;
          _lastTotalCount = state.properties.totalCount;
          logger.i(
            'Properties loaded: ${state.properties.data.length} items, page: ${state.properties.pageNumber}',
          );
        }

        final properties = _lastProperties?.data ?? [];
        final totalCount = _lastTotalCount;
        final pageCount =
            _lastProperties?.totalPage ?? (totalCount / rowsPerPage).ceil();

        if (properties.isEmpty && totalCount == 0) {
          return Center(
            child: Text(
              S.of(context).noDataAvailable,
              style: AppTextStyles.text14pxRegular(context),
            ),
          );
        }

        logger.i(
          'Total Count: $totalCount, Rows Per Page: $rowsPerPage, Page Count: $pageCount',
        );
        return Column(
          children: [
            Expanded(child: _buildPropertyTable(properties)),
            const SizedBox(height: 12),
            CustomPagination(
              currentPage: currentPage,
              pageCount: pageCount,
              onPageChanged: _onPageChanged,
            ),
          ],
        );
      },
    );
  }

  Widget _buildPropertyTable(List<Property> properties) {
    return SingleChildScrollView(
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
            decoration: const BoxDecoration(color: Colors.transparent),
            children: [
              CustomHeaderCall(text: S.of(context).unitType, context: context),
              CustomHeaderCall(
                text: S.of(context).governorate,
                context: context,
              ),
              CustomHeaderCall(text: S.of(context).addedDate, context: context),
              CustomHeaderCall(text: S.of(context).ownerName, context: context),
              CustomHeaderCall(text: S.of(context).status, context: context),
              CustomHeaderCall(text: S.of(context).actions, context: context),
            ],
          ),
          ...properties
              .map<TableRow>((property) => _buildPropertyRow(property))
              .toList(),
        ],
      ),
    );
  }

  TableRow _buildPropertyRow(Property property) {
    final status = property.propertySaleStatus ?? 'Available'; // معالجة null

    return TableRow(
      children: [
        CustomDataCell(text: property.id.toString() ?? '', context: context),
        CustomDataCell(text: property.governorate ?? 'N/A', context: context),
        // عرض "N/A" إذا كان null
        CustomDataCell(text: property.createdAt ?? 'N/A', context: context),
        // عرض "N/A" إذا كان null
        CustomDataCell(text: property.ownerName ?? 'N/A', context: context),
        // عرض "N/A" إذا كان null
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: DropdownButton<String>(
            icon: const Icon(Icons.arrow_drop_down),
            iconSize: 24,
            underline: Container(color: Colors.transparent),
            items: [
              DropdownMenuItem(
                value: 'Available',
                child: Text(
                  S.of(context).availableShort,
                  style: AppTextStyles.text14pxRegular(context),
                ),
              ),
              DropdownMenuItem(
                value: 'Waiting_for_reply',
                child: Text(
                  S.of(context).pendingShort,
                  style: AppTextStyles.text14pxRegular(context),
                ),
              ),
              DropdownMenuItem(
                value: 'UnderReview',
                child: Text(
                  S.of(context).underInspectionShort,
                  style: AppTextStyles.text14pxRegular(context),
                ),
              ),
              DropdownMenuItem(
                value: 'Sold',
                child: Text(
                  S.of(context).soldShort,
                  style: AppTextStyles.text14pxRegular(context),
                ),
              ),
            ],
            onChanged: null,
            value: status,
          ),
        ),
        ActionCell(
          index: 0,
          isView: true,
          onDelete: () {},
          onView: () {
            // تنفيذ منطق العرض هنا
          },
          iDark: context.watch<ThemeCubit>().state == ThemeMode.dark,
        ),
      ],
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
              onTap: onView,
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                Assets.imagesHugeiconsView,
                color:
                    iDark
                        ? AppColors.darkModeAccent
                        : AppColors.lightModeAccent,
              ),
            ),
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                Assets.imagesBasilEditOutline,
                color:
                    iDark
                        ? AppColors.darkModeAccent
                        : AppColors.lightModeAccent,
              ),
            ),
            InkWell(
              onTap: onDelete,
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                Assets.imagesFluentDelete32Regular,
                color:
                    iDark
                        ? AppColors.darkModeAccent
                        : AppColors.lightModeAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
