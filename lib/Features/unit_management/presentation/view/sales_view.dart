import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_properties/presentation/view/requests_to_add_new_properties.dart';

class SalesView extends StatefulWidget {
  const SalesView({super.key});

  @override
  State<SalesView> createState() => _SalesViewState();
}

class _SalesViewState extends State<SalesView> {
  int currentPage = 1;
  int totalPages = 5;
  final List<bool> isActiveList = [false, false, true, true, false];
  int selectedTabIndex = 0;

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
              4: FlexColumnWidth(1.5),
              5: FlexColumnWidth(1.8),
            },
            children: [
              TableRow(
                decoration: BoxDecoration(color: Colors.transparent),
                children: [
                  HeaderCell(text: S.of(context).unitType, context: context),
                  HeaderCell(text: S.of(context).governorate, context: context),
                  HeaderCell(text: S.of(context).addedDate, context: context),
                  HeaderCell(text: S.of(context).ownerName, context: context),
                  HeaderCell(text: S.of(context).status, context: context),
                  HeaderCell(text: S.of(context).actions, context: context),
                ],
              ),
              ...List.generate(5, (index) {
                return TableRow(
                  children: [
                    DataCell(text: S.of(context).villa, context: context),
                    DataCell(text: S.of(context).alexandria, context: context),
                    DataCell(text: '29-6-2025', context: context),
                    DataCell(text: '29-6-2025', context: context),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8.0,
                        horizontal: 12,
                      ),
                      child: DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        underline: Container(color: Colors.transparent),
                        items: [
                          DropdownMenuItem(
                            value: S.of(context).availableShort,
                            child: Text(S.of(context).availableShort,
                            style: AppTextStyles.text14pxRegular(context),
                            ),
                          ),
                          DropdownMenuItem(
                            value: S.of(context).pendingShort,
                            child: Text(S.of(context).pendingShort ,style: AppTextStyles.text14pxRegular(context),),
                          ),
                          DropdownMenuItem(
                            value: S.of(context).underInspectionShort,
                            child: Text(S.of(context).underInspectionShort,style: AppTextStyles.text14pxRegular(context),),
                          ),
                          DropdownMenuItem(
                            value: S.of(context).soldShort,
                            child: Text(S.of(context).soldShort,style: AppTextStyles.text14pxRegular(context),),
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

class HeaderCell extends StatelessWidget {
  const HeaderCell({super.key, required this.text, required this.context});

  final String text;
  final BuildContext context;

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Text(text, style: AppTextStyles.buttonLarge20pxRegular(context)),
      ),
    ),
  );
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
            SvgPicture.asset(
              Assets.imagesFluentDelete32Regular,
            ),
          ],
        ),
      ),
    );
  }
}