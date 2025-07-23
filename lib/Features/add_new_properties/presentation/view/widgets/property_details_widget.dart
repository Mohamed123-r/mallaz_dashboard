import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/assets.dart';
import '../../../../../generated/l10n.dart';
import '../../../../home/presentation/view/preview_requests_details_view.dart';
import '../../../../home/presentation/view/widgets/icon_text_row.dart';
import '../../../data/models/property_details_model.dart';

class PropertyDetailsWidget extends StatelessWidget {
  final bool isDark;
  final PropertyDetailsModel details;

  const PropertyDetailsWidget({
    super.key,
    required this.isDark,
    required this.details,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).propertyDetails,
          style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
            color:
                isDark
                    ? AppColors.darkModeButtonsPrimary
                    : AppColors.lightModeButtonsPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.graysGray4,
              child:
                  details.ownerImage!.isNotEmpty
                      ? Image.network(details.ownerImage!, fit: BoxFit.cover)
                      : Icon(
                        Icons.person,
                        size: 32,
                        color:
                            isDark
                                ? AppColors.darkModeText
                                : AppColors.lightModeText,
                      ),
            ),
            const SizedBox(width: 12),
            Text(
              details.ownerName!,
              style: AppTextStyles.buttonLarge20pxRegular(context),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          "${details.governorate} ${details.city}",
          style: AppTextStyles.subtitleTitle20pxRegular(context),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            SvgPicture.asset(
              Assets.imagesStraighten,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
            const SizedBox(width: 8),
            Text(
              '${details.area} م²',
              style: AppTextStyles.text14pxRegular(context),
            ),
            const SizedBox(width: 24),
            SvgPicture.asset(
              Assets.imagesStairs,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
            const SizedBox(width: 8),
            Text(
              details.floor ?? "",
              style: AppTextStyles.text14pxRegular(context),
            ),
            const SizedBox(width: 24),
            SvgPicture.asset(
              Assets.imagesDoor,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),
            const SizedBox(width: 8),
            Text(
              "${details.rooms} غرف",
              style: AppTextStyles.text14pxRegular(context),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // السعر
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: isDark ? AppColors.lightModeText : AppColors.darkModeText,
          ),
          child: Text(
            S.of(context).unitPrice('${details.price}'),
            style: AppTextStyles.buttonLarge20pxRegular(context),
          ),
        ),
        const SizedBox(height: 12),
        if (details.description != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              details.description!,
              style: AppTextStyles.text14pxRegular(context),
            ),
          ),
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
                  text: "${details.bathrooms} ${S.of(context).bathroom}",
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
    );
  }
}
