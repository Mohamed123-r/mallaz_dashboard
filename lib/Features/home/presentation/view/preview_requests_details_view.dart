import 'package:book_apartment_dashboard/core/utils/app_text_styles.dart';
import 'package:book_apartment_dashboard/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/services/locale_cubit.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../generated/l10n.dart';

class PreviewRequestsDetailsView extends StatelessWidget {
  const PreviewRequestsDetailsView({super.key, required this.onTapBack});
  final  VoidCallback onTapBack;
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: onTapBack,
            icon: Icon(
              Icons.arrow_back_ios,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle(context, isDark, S.of(context).unitData),
                const SizedBox(height: 8),
                _unitDetailsCard(context, isDark),
                const SizedBox(height: 16),
                _sectionTitle(context, isDark, S.of(context).contactData),
                const SizedBox(height: 8),
                _contactRow(context, isDark),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(BuildContext context, bool isDark, String text) {
    return Text(
      text,
      style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
        color:
            isDark
                ? AppColors.darkModeButtonsPrimary
                : AppColors.lightModeButtonsPrimary,
      ),
    );
  }

  Widget _unitDetailsCard(BuildContext context, bool isDark) {
    return Container(
      height: 370,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color:
            isDark
                ? AppColors.darkModeBackground
                : AppColors.lightModeBackground,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Image.asset(Assets.imagesTest1, fit: BoxFit.cover),
          ),
          const SizedBox(width: 24),
          Expanded(flex: 5, child: _unitDetailsColumn(context, isDark)),
        ],
      ),
    );
  }

  Widget _unitDetailsColumn(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).cityCairo,
          style: AppTextStyles.subtitleTitle20pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).districtTagamoa,
          style: AppTextStyles.subtitle16pxRegular(context),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            SvgPicture.asset(
              Assets.imagesStraighten,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
            const SizedBox(width: 8),
            Text('120 م²', style: AppTextStyles.text14pxRegular(context)),
            const SizedBox(width: 24),
            SvgPicture.asset(
              Assets.imagesStairs,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
            const SizedBox(width: 8),
            Text(
              S.of(context).firstFloor,
              style: AppTextStyles.text14pxRegular(context),
            ),
            const SizedBox(width: 24),
            SvgPicture.asset(
              Assets.imagesDoor,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
            const SizedBox(width: 8),
            Text(
              S.of(context).rooms3,
              style: AppTextStyles.text14pxRegular(context),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).detailedAddress,
          style: AppTextStyles.subtitle16pxRegular(context),
        ),
        Text(
          S.of(context).fullAddress,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDark ? AppColors.lightModeText : AppColors.darkModeText,
          ),
          child: Text(
            S.of(context).unitPrice('2,300,000'),
            style: AppTextStyles.buttonLarge20pxRegular(context),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            _unitFeaturesColumn(context, isDark),
            const SizedBox(width: 64),
            _unitStatusColumn(context),
          ],
        ),
      ],
    );
  }

  Widget _unitFeaturesColumn(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTextRow(context: context, isDark: isDark, asset: Assets.imagesWif, text: S.of(context).freeWifi),
        const SizedBox(height: 4),
        IconTextRow(context: context, isDark: isDark, asset: Assets.imagesParker, text: S.of(context).privateGarage),
        const SizedBox(height: 4),
        IconTextRow(context: context, isDark: isDark, asset: Assets.imagesSecurity, text: S.of(context).security247),
      ],
    );
  }


  Widget _unitStatusColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).immediateHousing,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).fullyFinished,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).readyForDelivery,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).installmentsAvailable,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          S.of(context).downPayment('500,000'),
          style: AppTextStyles.text14pxRegular(context),
        ),
      ],
    );
  }

  Widget _contactRow(BuildContext context, bool isDark) {
    return Row(
      children: [
        _contactCard(context, isDark, S.of(context).ownerName, '010101010100'),
        const SizedBox(width: 16),
        _contactCard(context, isDark, S.of(context).clientName, '010101010100'),
        Expanded(child: _noteCard(context, isDark)),
      ],
    );
  }

  Widget _contactCard(
    BuildContext context,
    bool isDark,
    String name,
    String phone,
  ) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(width: 1, color: AppColors.graysGray4),
      ),
      color:
          isDark ? AppColors.darkModeBackground : AppColors.lightModeBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor:
                  isDark
                      ? AppColors.darkModeButtonsPrimary
                      : AppColors.lightModeButtonsPrimary,
            ),
            const SizedBox(height: 4),
            Text(name, style: AppTextStyles.text14pxRegular(context)),
            const SizedBox(height: 4),
            Text(phone, style: AppTextStyles.text14pxRegular(context)),
          ],
        ),
      ),
    );
  }

  Widget _noteCard(BuildContext context, bool isDark) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(width: 1, color: AppColors.graysGray4),
      ),
      color:
          isDark ? AppColors.darkModeBackground : AppColors.lightModeBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 150,
                  child: DropdownButton(
                    value: S.of(context).mohamed,
                    items:
                        [S.of(context).mohamed, S.of(context).ahmed].map((
                          String dropDownStringItem,
                        ) {
                          return DropdownMenuItem<String>(
                            value: dropDownStringItem,
                            child: Text(dropDownStringItem),
                          );
                        }).toList(),
                    onChanged: (value) {},
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color:
                          isDark
                              ? AppColors.darkModeText
                              : AppColors.lightModeText,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: 1,
                    height: 40,
                    color: AppColors.graysGray4,
                  ),
                ),
                SizedBox(
                  width: 360,
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: S.of(context).addNoteHere,
                      hintStyle: AppTextStyles.text14pxRegular(
                        context,
                      ).copyWith(
                        color:
                            isDark
                                ? AppColors.darkModeGrayText
                                : AppColors.lightModeGrayText,
                      ),
                      border: InputBorder.none,
                    ),
                    style: AppTextStyles.text14pxRegular(context),
                  ),
                ),
              ],
            ),
            MaterialButton(
              height: 50,
              minWidth: 200,
              onPressed: () {},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                S.of(context).save,
                style: AppTextStyles.buttonLarge20pxRegular(
                  context,
                ).copyWith(color: AppColors.black),
              ),
              color: AppColors.graysGray3,
            ),
          ],
        ),
      ),
    );
  }
}

class IconTextRow extends StatelessWidget {
  const IconTextRow({
    super.key,
    required this.context,
    required this.isDark,
    required this.asset,
    required this.text,
  });

  final BuildContext context;
  final bool isDark;
  final String asset;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          asset,
          color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
        ),
        const SizedBox(width: 8),
        Text(text, style: AppTextStyles.text14pxRegular(context)),
      ],
    );
  }
}
