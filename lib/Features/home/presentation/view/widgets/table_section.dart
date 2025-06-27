
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';

class TableSection extends StatelessWidget {
  const TableSection({
    super.key,
    required this.isDark, required this.onTapSeeDetails,
  });

  final bool isDark;
  final  VoidCallback onTapSeeDetails ;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(8),
        color: AppColors.graysGray2,
      ),
      children: [
        TableRow(
          children: [
            _tableHeaderCell(context, isDark, S.of(context).unitNumber),
            _tableHeaderCell(context, isDark, S.of(context).userName),
            _tableHeaderCell(context, isDark, S.of(context).phoneNumber),
            _tableHeaderCell(context, isDark, S.of(context).ownerName),
            _tableHeaderCell(context, isDark, S.of(context).phoneNumber),
            _tableHeaderCell(context, isDark, S.of(context).status),
            _tableHeaderCell(context, isDark, S.of(context).actions),
          ],
        ),
        TableRow(
          children: [
            _tableDataCell(context, isDark, "1"),
            _tableDataCell(context, isDark, "محمد"),
            _tableDataCell(context, isDark, "010101010100"),
            _tableDataCell(context, isDark, "احمد"),
            _tableDataCell(context, isDark, "010101010100"),
            TableCell(
              child: Center(
                child: DropdownButton(
                  value: "محمد",
                  items: ["محمد", "احمد"].map((String dropDownStringItem) {
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(
                        dropDownStringItem,
                        style: AppTextStyles.subtitle16pxRegular(context).copyWith(
                          color: isDark
                              ? AppColors.darkModeText
                              : AppColors.lightModeText,
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValueSelected) {},
                ),
              ),
            ),
            TableCell(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: onTapSeeDetails,
                        borderRadius: BorderRadius.circular(8) ,
                        child: SvgPicture.asset(
                          Assets.imagesHugeiconsView,
                          color: isDark
                              ? AppColors.darkModeAccent
                              : AppColors.lightModeAccent,
                        ),
                      ),
                      SvgPicture.asset(
                        Assets.imagesBasilEditOutline,
                        color: isDark
                            ? AppColors.darkModeAccent
                            : AppColors.lightModeAccent,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  TableCell _tableHeaderCell(BuildContext context, bool isDark, String text) {
    return TableCell(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: AppTextStyles.subtitle16pxRegular(context).copyWith(
              color: isDark
                  ? AppColors.darkModeText
                  : AppColors.lightModeText,
            ),
          ),
        ),
      ),
    );
  }

  TableCell _tableDataCell(BuildContext context, bool isDark, String text) {
    return TableCell(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            text,
            style: AppTextStyles.text14pxRegular(context).copyWith(
              color: isDark
                  ? AppColors.darkModeText
                  : AppColors.lightModeText,
            ),
          ),
        ),
      ),
    );
  }
}