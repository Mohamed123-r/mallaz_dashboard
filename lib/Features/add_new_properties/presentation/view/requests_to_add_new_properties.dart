import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/view/widgets/requests_table.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/view/widgets/tabs.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/app_text_styles.dart';
import '../../../../core/services/locale_cubit.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_data_cell.dart';
import '../../../../core/widgets/custom_header_call.dart';
import '../../../../core/widgets/custom_pagination.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/add_new_properties_model.dart';
import '../../data/repo/add_new_properties_repo_impl.dart';
import '../cubit/add_new_properties_cubit.dart';
import '../cubit/add_new_properties_stats.dart';

class RequestsToAddNewProperties extends StatefulWidget {
  const RequestsToAddNewProperties({super.key, required this.onTapSeeDetails});

  /// Callback receives the id of the property item pressed
  final void Function(int id) onTapSeeDetails;

  @override
  State<RequestsToAddNewProperties> createState() =>
      _RequestsToAddNewPropertiesState();
}

class _RequestsToAddNewPropertiesState
    extends State<RequestsToAddNewProperties> {
  int selectedTabIndex = 0;
  final tabs = <String>[];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    tabs.clear();
    tabs.addAll([S.of(context).forSale, S.of(context).rent]);
  }

  int get currentPage {
    final state = context.watch<PropertyRequestCubit>().state;
    if (state is PropertyRequestSuccess) {
      return state.pageNumber;
    }
    return 1;
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PropertyRequestCubit>().fetchRequests(
        propertyType: "Sale",
        pageNumber: 1,
        pageSize: 6,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    final locale = context.watch<LocaleCubit>().state == Locale('ar') ? 'ar' : 'en';
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<PropertyRequestCubit, PropertyRequestState>(
            builder: (context, state) {
              int count = 0;
              if (state is PropertyRequestSuccess) count = state.totalCount;
              return Row(
                children: [
                  Text(
                    S.of(context).requestsCount,
                    style: AppTextStyles.buttonLarge20pxRegular(context),
                  ),
                  const SizedBox(width: 8),
                  Text("$count", style: AppTextStyles.buttonLarge20pxRegular(context)),
                ],
              );
            },
          ),
          const SizedBox(height: 16),
          Tabs(
            tabs: tabs,
            selectedIndex: selectedTabIndex,
            onTabSelected: (i) {
              setState(() => selectedTabIndex = i);
              final type = i == 0 ? 'sale' : 'rent';
              context.read<PropertyRequestCubit>().fetchRequests(
                propertyType: type,
                pageNumber: 1,
                pageSize: 6,
              );
            },
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: RequestsTable(
              onTapSeeDetails: (int id) {
                widget.onTapSeeDetails(id);
              },
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<PropertyRequestCubit, PropertyRequestState>(
            builder: (context, state) {
              int pageCount = 1;
              if (state is PropertyRequestSuccess) {
                pageCount = (state.totalCount / 6).ceil();
                if (pageCount == 0) pageCount = 1;
              }
              return CustomPagination(
                pageCount: pageCount,
                currentPage: currentPage,
                onPageChanged: (page) {
                  context.read<PropertyRequestCubit>().fetchRequests(
                    propertyType: selectedTabIndex == 0 ? 'sale' : 'rent',
                    pageNumber: page,
                    pageSize: 6,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}