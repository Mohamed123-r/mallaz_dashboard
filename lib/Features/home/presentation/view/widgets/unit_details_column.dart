import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_new_properties/data/models/property_details_model.dart';
import '../../../../add_new_properties/presentation/view/widgets/icon_text_row.dart';

class UnitDetailsColumn extends StatelessWidget {
  const UnitDetailsColumn({
    super.key,
    required this.context,
    required this.isDark,
    required this.details,
  });

  final BuildContext context;
  final bool isDark;
  final PropertyDetailsModel details;

  @override
  Widget build(BuildContext context) {
    final areaText = '${details.area} م²';
    final priceText = details.price.toString();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          details.governorate!.isNotEmpty
              ? details.governorate!
              : S.of(context).cityCairo,
          style: AppTextStyles.subtitleTitle20pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          details.city!.isNotEmpty ? details.city! : S.of(context).targetGroup,
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
            Text(areaText, style: AppTextStyles.text14pxRegular(context)),
            const SizedBox(width: 24),
            SvgPicture.asset(
              Assets.imagesStairs,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
            const SizedBox(width: 8),
            Text(
              details.floor!.isNotEmpty
                  ? details.floor!
                  : S.of(context).firstFloor,
              style: AppTextStyles.text14pxRegular(context),
            ),
            const SizedBox(width: 24),
            SvgPicture.asset(
              Assets.imagesDoor,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
            const SizedBox(width: 8),
            Text(
              details.rooms!.isNotEmpty ? details.rooms! : S.of(context).rooms3,
              style: AppTextStyles.text14pxRegular(context),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDark ? AppColors.lightModeText : AppColors.darkModeText,
          ),
          child: Text(
            S.of(context).unitPrice(priceText),
            style: AppTextStyles.buttonLarge20pxRegular(context),
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            if (details.description != null)
              SizedBox(
                width: 250,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    details.description!,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.text14pxRegular(context),
                  ),
                ),
              ),

            const SizedBox(width: 64),
            Column(
              children: [
                Text(
                  S.of(context).mainFacilities,
                  style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                    color:
                    isDark
                        ? AppColors.darkModeButtonsPrimary
                        : AppColors.lightModeButtonsPrimary,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (details.hasWifi == true)
                        IconTextRow(
                          context: context,
                          isDark: isDark,
                          asset: Assets.imagesWif,
                          text: S.of(context).freeWifi,
                        ),
                      if (details.isFurnished == true)
                        IconTextRow(
                          context: context,
                          isDark: isDark,
                          asset: Assets.imagesTrue,
                          text: S.of(context).furnished,
                        ),
                      if (details.bathrooms != "")
                        IconTextRow(
                          context: context,
                          isDark: isDark,
                          asset: Assets.imagesTrue,
                          text:
                          "${details.bathrooms} ${S.of(context).bathroom}",
                        ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "${S.of(context).propertyType}: ${details.type}",
                    style: AppTextStyles.text14pxRegular(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text(
                    "${S.of(context).forSaleOrRent}: ${details.propertyType}",
                    style: AppTextStyles.text14pxRegular(context),
                  ),
                ),
                if (details.rentType != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      "${S.of(context).rentType}: ${details.rentType}",
                      style: AppTextStyles.text14pxRegular(context),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

