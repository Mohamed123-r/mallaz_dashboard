import 'package:book_apartment_dashboard/constant.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_data_cell.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_header_call.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_pagination.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/helper_functions/get_it.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_properties/data/models/property_details_model.dart';
import '../../../add_new_properties/data/repo/property_action_repo_impl.dart';
import '../../../add_new_properties/data/repo/property_details_repo.dart';
import '../../../add_new_properties/presentation/cubit/property_action_cubit.dart';
import '../../../add_new_properties/presentation/cubit/property_action_state.dart';
import '../../../add_new_properties/presentation/cubit/property_details_cubit.dart';
import '../../../add_new_properties/presentation/cubit/property_details_state.dart';
import '../../../add_new_properties/presentation/view/widgets/tabs.dart';
import '../../data/models/property_model.dart';
import '../cubit/property_cubit.dart';

class RentToLeaseView extends StatefulWidget {
  const RentToLeaseView({
    super.key,
    required this.onTapSeeDetails,
    required this.onTapEddDetails,
  });

  final void Function(int id) onTapSeeDetails;
  final void Function(int id) onTapEddDetails;

  @override
  State<RentToLeaseView> createState() => _RentToLeaseViewState();
}

class _RentToLeaseViewState extends State<RentToLeaseView> {
  final int rowsPerPage = 10;
  int currentPage = 1;
  int selectedTabIndex = 0;
  String? selectedStatus;
  PropertyModel? _lastProperties;
  num _lastTotalCount = 0;

  num allUnitsCount = 0;
  int availableCount = 0;
  int underInspectionCount = 0;
  int rentedCount = 0;
  int page = 0;

  @override
  void initState() {
    super.initState();
    selectedStatus = '';
    _fetchPage(currentPage);
    _fetchCounts();
  }

  void _onPageChanged(int page) {
    if (!mounted) return;
    setState(() => currentPage = page);
    _fetchPage(page);
    logger.i('Page changed to: $page');
  }

  void _fetchPage(int page) {
    if (!mounted) return;
    logger.i('Fetching page: $page with rent status: $selectedStatus');
    context.read<PropertyCubit>().fetchProperties(
      propertyType: 'Rent',
      pageNumber: page,
      pageSize: rowsPerPage,
      propertySaleStatus: '',
      propertyRentStatus: selectedStatus ?? '',
    );
  }

  Future<void> _fetchCounts() async {
    final cubit = context.read<PropertyCubit>();

    final all = await cubit.fetchPropertiesCount(propertyType: 'Rent');
    final available = await cubit.fetchPropertiesCount(
      propertyType: 'Rent',
      propertyRentStatus: 'Available',
    );
    final underInspection = await cubit.fetchPropertiesCount(
      propertyType: 'Rent',
      propertyRentStatus: 'UnderReview',
    );
    final rented = await cubit.fetchPropertiesCount(
      propertyType: 'Rent',
      propertyRentStatus: 'Rented',
    );

    setState(() {
      allUnitsCount = all;
      availableCount = available;
      underInspectionCount = underInspection;
      rentedCount = rented;
    });
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      S.of(context).allUnits(allUnitsCount.toString()),
      S.of(context).available(availableCount.toString()),
      S.of(context).underInspection(underInspectionCount.toString()),
      S.of(context).rentedUnits(rentedCount.toString()),
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
                  currentPage = 1;
                  selectedStatus =
                      i == 0
                          ? ''
                          : i == 1
                          ? 'Available'
                          : i == 2
                          ? 'UnderReview'
                          : 'Rented';
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
          0: FlexColumnWidth(1.2),
          1: FlexColumnWidth(1.2),
          2: FlexColumnWidth(1.9),
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
    final status = property.propertyRentStatus ?? 'Available';

    return TableRow(
      children: [
        CustomDataCell(text: property.id.toString() ?? '', context: context),
        CustomDataCell(text: property.governorate ?? '', context: context),
        CustomDataCell(text: property.createdAt ?? '', context: context),
        CustomDataCell(text: property.ownerName ?? '', context: context),

        BlocProvider(
          create:
              (context) =>
                  PropertyDetailsCubit(getIt.get<PropertyDetailsRepo>()),
          child: RentStateSection(
            contextt: context,
            status: status,
            id: property.id,
            page: currentPage,
            rowsPerPage: rowsPerPage,
            selectedStatus: selectedStatus ?? "",
          ),
        ),

        BlocProvider(
          create:
              (context) => PropertyActionsCubit(PropertyActionsRepoImpl(Dio())),
          child: ActionCell(
            id: property.id,
            isView: true,
            selectedStatus: selectedStatus!,
            page: currentPage,
            rowsPerPage: rowsPerPage,
            onTapEddDetails: widget.onTapEddDetails,
            onTapSeeDetails: widget.onTapSeeDetails,
            iDark: context.watch<ThemeCubit>().state == ThemeMode.dark,
          ),
        ),
      ],
    );
  }
}

class RentStateSection extends StatefulWidget {
  const RentStateSection({
    super.key,
    required this.contextt,
    required this.status,
    required this.id,
    required this.page,
    required this.rowsPerPage,
    required this.selectedStatus,
  });

  final BuildContext contextt;
  final String status;
  final int id;
  final int page;
  final int rowsPerPage;
  final String selectedStatus;

  @override
  State<RentStateSection> createState() => _RentStateSectionState();
}

class _RentStateSectionState extends State<RentStateSection> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsFailure) return Text(state.error);

        return Padding(
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
                value: 'UnderReview',
                child: Text(
                  S.of(context).underInspectionShort,
                  style: AppTextStyles.text14pxRegular(context),
                ),
              ),
              DropdownMenuItem(
                value: 'Rented',
                child: Text(
                  S.of(context).rentedShort,
                  style: AppTextStyles.text14pxRegular(context),
                ),
              ),
            ],
            onChanged: (value) async {
              await DioConsumer(dio: Dio()).put(
                '/api/Property',
                data: {"propertyId": widget.id, "propertyRentStatus": value},
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(S.of(context).changesSaved)),
              );
              context.read<PropertyCubit>().fetchProperties(
                propertyType: 'Rent',
                pageNumber: widget.page,
                pageSize: widget.rowsPerPage,
                propertySaleStatus: '',
                propertyRentStatus: widget.selectedStatus ?? "",
              );
            },
            value: widget.status,
          ),
        );
      },
    );
  }
}

class ActionCell extends StatelessWidget {
  final int id;
  final bool isView;
  final bool iDark;
  final int page;
  final int rowsPerPage;

  final String selectedStatus;
  final void Function(int id) onTapSeeDetails;
  final void Function(int id) onTapEddDetails;

  const ActionCell({
    super.key,
    required this.id,
    this.isView = false,

    required this.iDark,
    required this.onTapSeeDetails,
    required this.onTapEddDetails,
    required this.page,
    required this.rowsPerPage,
    required this.selectedStatus,
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
              onTap: () {
                onTapSeeDetails(id);
              },
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
              onTap: () {
                onTapEddDetails(id);
              },
              borderRadius: BorderRadius.circular(8),
              child: SvgPicture.asset(
                Assets.imagesBasilEditOutline,
                color:
                    iDark
                        ? AppColors.darkModeAccent
                        : AppColors.lightModeAccent,
              ),
            ),

            BlocConsumer<PropertyActionsCubit, PropertyActionsState>(
              listener: (context, state) {
                if (state is PropertyActionSuccess) {
                  // Show success message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("تمت العملية بنجاح!"),
                      backgroundColor: Colors.green,
                    ),
                  );
                  context.read<PropertyCubit>().fetchProperties(
                    propertyType: 'Rent',
                    pageNumber: page,
                    pageSize: rowsPerPage,
                    propertySaleStatus: selectedStatus ?? "",
                    propertyRentStatus: '',
                  );
                } else if (state is PropertyActionFailure) {
                  // Show error message
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                final cubit = context.read<PropertyActionsCubit>();
                return InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(S.of(context).confirmDelete),
                          content: Text(S.of(context).confirmDeleteMessage),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(S.of(context).cancel),
                            ),
                            TextButton(
                              onPressed: () {
                                cubit.deleteProperty(id);
                                Navigator.pop(context);
                              },
                              child: Text(S.of(context).delete),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  borderRadius: BorderRadius.circular(8),
                  child: SvgPicture.asset(
                    Assets.imagesFluentDelete32Regular,
                    color:
                        iDark
                            ? AppColors.darkModeAccent
                            : AppColors.lightModeAccent,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
