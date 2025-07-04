import 'package:book_apartment_dashboard/Features/unit_management/presentation/view/sales_view.dart';
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

class RentToLeaseView extends StatefulWidget {
  const RentToLeaseView({super.key});

  @override
  State<RentToLeaseView> createState() => _RentToLeaseViewState();
}

class _RentToLeaseViewState extends State<RentToLeaseView> {
  int currentPage = 1;
  int totalPages = 5;
  final List<bool> isActiveList = [false, false, true, true, false];
  int selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      S.of(context).allUnits('1,500'),
      S.of(context).available('500'),
      S.of(context).contractExpiring('100'),
      S.of(context).underInspection('100'),
      S.of(context).rentedUnits('800'),
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
            onTabSelected: (i) => setState(() => selectedTabIndex = i),
            isDark: isDark,
          ),
          const SizedBox(height: 16),
          Table(
            border: TableBorder.all(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.graysGray2,
            ),
            columnWidths: const {
              0: FlexColumnWidth(1.5),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(1.5),
              3: FlexColumnWidth(1.5),
              4: FlexColumnWidth(1.6),
              5: FlexColumnWidth(1.8),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.transparent),
                children: [
                  HeaderCell(text: S.of(context).unitNumber, context: context),
                  HeaderCell(text: S.of(context).governorate, context: context),
                  HeaderCell(text: S.of(context).contractDuration, context: context),
                  HeaderCell(text: S.of(context).endDate, context: context),
                  HeaderCell(text: S.of(context).status, context: context),
                  HeaderCell(text: S.of(context).actions, context: context),
                ],
              ),
              ...List.generate(5, (index) {
                return TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16,
                      ),
                      child: DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        underline: Container(color: Colors.transparent),
                        items: [
                          DropdownMenuItem(
                            value: "001",
                            child: Text("001"),
                          ),
                          DropdownMenuItem(
                            value: "002",
                            child: Text("002"),
                          ),
                          DropdownMenuItem(
                            value: "003",
                            child: Text("003"),
                          ),
                          DropdownMenuItem(
                            value: "004",
                            child: Text("004"),
                          ),
                        ],
                        onChanged: (value) {},
                        value: "001",
                      ),
                    ),
                    DataCell(text: S.of(context).alexandria, context: context),
                    DataCell(text: '3 أشهر', context: context),
                    DataCell(text: '29-6-2025', context: context),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 16,
                      ),
                      child: DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        underline: Container(color: Colors.transparent),
                        items: [
                          DropdownMenuItem(
                            value: S.of(context).availableShort,
                            child: Text(S.of(context).availableShort,style: AppTextStyles.text14pxRegular(context),),
                          ),
                          DropdownMenuItem(
                            value: S.of(context).contractExpiringShort ,
                            child: Text(S.of(context).contractExpiringShort,style: AppTextStyles.text14pxRegular(context),),
                          ),
                          DropdownMenuItem(
                            value: S.of(context).underInspectionShort,
                            child: Text(S.of(context).underInspectionShort,style: AppTextStyles.text14pxRegular(context),),
                          ),
                          DropdownMenuItem(
                            value: S.of(context).rentedShort ,
                            child: Text(S.of(context).rentedShort ,style: AppTextStyles.text14pxRegular(context),),
                          ),
                        ],
                        onChanged: (value) {},
                        value: S.of(context).availableShort,
                      ),
                    ),
                    ActionCell(
                      index: index,
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
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: currentPage > 1
                    ? () => setState(() => currentPage--)
                    : null,
              ),
              const SizedBox(width: 8),
              Text('$currentPage ... $totalPages'),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: currentPage < totalPages
                    ? () => setState(() => currentPage++)
                    : null,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DataCell extends StatelessWidget {
  const DataCell({super.key, required this.text, required this.context});

  final String text;
  final BuildContext context;

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(text, style: AppTextStyles.text14pxRegular(context)),
      ),
    ),
  );
}