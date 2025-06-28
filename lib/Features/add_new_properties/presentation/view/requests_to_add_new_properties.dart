import 'package:book_apartment_dashboard/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/locale_cubit.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart'; // Update with your localization import

class RequestsToAddNewProperties extends StatefulWidget {
  const RequestsToAddNewProperties({super.key, required this.onTapSeeDetails});
  final  VoidCallback onTapSeeDetails ;
  @override
  State<RequestsToAddNewProperties> createState() =>
      _RequestsToAddNewPropertiesState();
}

class _RequestsToAddNewPropertiesState
    extends State<RequestsToAddNewProperties> {
  int selectedTabIndex = 1;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      S.of(context).forSale,
      S.of(context).partialRent,
      S.of(context).rent,
    ];
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;

    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 24, start: 16, end: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                S.of(context).requestsCount,
                style: AppTextStyles.buttonLarge20pxRegular(context),
              ),
              const SizedBox(width: 8),
              Text("555", style: AppTextStyles.buttonLarge20pxRegular(context)),
            ],
          ),
          const SizedBox(height: 16),
          Tabs(
            tabs: tabs,
            selectedIndex: selectedTabIndex,
            onTabSelected: (i) => setState(() => selectedTabIndex = i),
            isDark: isDark,
          ),
          const SizedBox(height: 16),
           _RequestsTable(onTapSeeDetails:  widget.onTapSeeDetails ,

          ),
        ],
      ),
    );
  }
}


class Tabs extends StatelessWidget {
  final List<String> tabs;
  final int selectedIndex;
  final ValueChanged<int> onTabSelected;
  final bool isDark;

  const Tabs({
    required this.tabs,
    required this.selectedIndex,
    required this.onTabSelected,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffC8CDD6)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: List.generate(
          tabs.length,
              (index) => Expanded(
            child: Row(
              children: [
                if (index > 0) // Add vertical divider except for the first item
                  VerticalDivider(
                    width: 1,
                    thickness: 1,
                    color: const Color(0xffC8CDD6),
                  ),
                Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(index == 0 ? 8 : 0),
                      bottomLeft: Radius.circular(index == 0 ? 8 : 0),
                      topRight: Radius.circular(index == tabs.length - 1 ? 8 : 0),
                      bottomRight: Radius.circular(index == tabs.length - 1 ? 8 : 0),
                    ),
                    onTap: () => onTabSelected(index),
                    child: Container(
                      height: 48,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: selectedIndex == index
                            ? isDark
                            ? AppColors.darkModeButtonsPrimary
                            : AppColors.lightModeButtonsPrimary
                            : Colors.transparent,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(index == tabs.length - 1? 8 : 0),
                          bottomLeft: Radius.circular(index ==  tabs.length - 1 ? 8 : 0),
                          topRight: Radius.circular(index ==0 ? 8 : 0),
                          bottomRight: Radius.circular(index == 0 ? 8 : 0),  ),
                      ),
                      child: Text(
                        tabs[index],
                        style: AppTextStyles.buttonLarge20pxRegular(context),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class _RequestsTable extends StatelessWidget {
  const _RequestsTable({required this.onTapSeeDetails});
  final  VoidCallback onTapSeeDetails ;
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.graysGray2,
      ),
      columnWidths: const {
        0: FlexColumnWidth(2.1),
        1: FlexColumnWidth(2.1),
        2: FlexColumnWidth(2.1),
        3: FlexColumnWidth(2.1),
        4: FlexColumnWidth(1.7),
      },

      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.transparent),
          children: [
            HeaderCall(text: S.of(context).propertyType, context: context),
            HeaderCall(text: S.of(context).governorate, context: context),
            HeaderCall(text: S.of(context).addedDate, context: context),
            HeaderCall(text: S.of(context).ownerName, context: context),
            HeaderCall(text: S.of(context).actions, context: context),
          ],
        ),
        ...List.generate(
          5,
          (index) => TableRow(
            children: [
              DataCell(text: S.of(context).apartmentOrRoom, context: context),

              DataCell(text: S.of(context).alexandria, context: context),
              DataCell(text: "29-6-2025", context: context),
              DataCell(text: S.of(context).ownerName, context: context),
              TableCell(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: MaterialButton(
                      height: 40,
                      minWidth: 100,
                      onPressed: onTapSeeDetails,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        S.of(context).showMore,
                        style: AppTextStyles.buttonLarge20pxRegular(
                          context,
                        ).copyWith(color: AppColors.black),
                      ),
                      color: AppColors.graysGray3,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

class HeaderCall extends StatelessWidget {
  const HeaderCall({
    super.key,
    required this.text,
    required this.context,
  });

  final String text;
  final dynamic context;

  @override
  Widget build(BuildContext context) => TableCell(
    child: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(text, style: AppTextStyles.subtitle16pxRegular(context)),
      ),
    ),
  );
}

class DataCell extends StatelessWidget {
  const DataCell({
    super.key,
    required this.text,
    required this.context,
  });

  final String text;
  final dynamic context;

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
