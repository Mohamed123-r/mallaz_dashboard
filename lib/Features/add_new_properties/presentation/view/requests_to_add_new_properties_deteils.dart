import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/services/locale_cubit.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../../home/presentation/view/preview_requests_details_view.dart';

class RequestsToAddNewPropertiesDetails extends StatelessWidget {
  const RequestsToAddNewPropertiesDetails({super.key, required this.onTapBack});

  final VoidCallback onTapBack;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: onTapBack,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
                ),
              ),
              Expanded(flex: 5, child: PropertyDetails(isDark: isDark)),
              const SizedBox(width: 36),
              Expanded(flex: 6, child: PropertyGallery(isDark: isDark)),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Accept
                MaterialButton(
                  height: 40,
                  minWidth: 200,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    S.of(context).accept,
                    style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(color: AppColors.black),
                  ),
                  color: AppColors.green,
                ),
                const SizedBox(width: 20),
                // Reject
                MaterialButton(
                  height: 40,
                  minWidth: 200,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    S.of(context).reject,
                    style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(color: AppColors.black),
                  ),
                  color: AppColors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class PropertyGallery extends StatelessWidget {
  const PropertyGallery({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    final images = [
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Text(
            S.of(context).gallery,
            style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
              color: isDark
                  ? AppColors.darkModeButtonsPrimary
                  : AppColors.lightModeButtonsPrimary,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Large main image
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(images[0], height: 286, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 16),
            // 2 stacked images
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      images[1],
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      images[2],
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Wide image below
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            images[0],
            height: 170,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

class PropertyDetails extends StatelessWidget {
  PropertyDetails({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Details Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Property details title
            Text(
              S.of(context).propertyDetails,
              style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                color: isDark
                    ? AppColors.darkModeButtonsPrimary
                    : AppColors.lightModeButtonsPrimary,
              ),
            ),
            const SizedBox(height: 8),
            // Owner (avatar + name)
            Row(
              children: [
                const CircleAvatar(radius: 28),
                const SizedBox(width: 12),
                Text(
                  S.of(context).ownerName,
                  style: AppTextStyles.buttonLarge20pxRegular(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).cityCairo + " " + S.of(context).districtTagamoa,
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
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: isDark ? AppColors.lightModeText : AppColors.darkModeText,
              ),
              child: Text(
                S.of(context).unitPrice('2,300,000'),
                style: AppTextStyles.buttonLarge20pxRegular(context),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              S.of(context).mainFacilities,
              style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                color: isDark
                    ? AppColors.darkModeButtonsPrimary
                    : AppColors.lightModeButtonsPrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconTextRow(
                    context: context,
                    isDark: isDark,
                    asset: Assets.imagesWif,
                    text: S.of(context).freeWifi,
                  ),
                  const SizedBox(height: 4),
                  IconTextRow(
                    context: context,
                    isDark: isDark,
                    asset: Assets.imagesParker,
                    text: S.of(context).privateGarage,
                  ),
                  const SizedBox(height: 4),
                  IconTextRow(
                    context: context,
                    isDark: isDark,
                    asset: Assets.imagesSecurity,
                    text: S.of(context).security247,
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconTextRow2(
                  isDark: isDark,
                  title: S.of(context).immediateHousing,
                ),
                const SizedBox(height: 4),
                IconTextRow2(
                  isDark: isDark,
                  title: S.of(context).fullyFinished,
                ),
                const SizedBox(height: 4),
                IconTextRow2(
                  isDark: isDark,
                  title: S.of(context).readyForDelivery,
                ),
                const SizedBox(height: 4),
                IconTextRow2(
                  isDark: isDark,
                  title: S.of(context).installmentsAvailable,
                ),
                const SizedBox(height: 4),
                IconTextRow2(
                  isDark: isDark,
                  title: S.of(context).downPayment('500,000'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class IconTextRow2 extends StatelessWidget {
  const IconTextRow2({super.key, required this.isDark, required this.title});

  final bool isDark;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          Assets.imagesTrue,
          color: isDark
              ? AppColors.darkModeButtonsPrimary
              : AppColors.lightModeButtonsPrimary,
        ),
        const SizedBox(width: 4),
        Text(title, style: AppTextStyles.subtitle16pxRegular(context)),
      ],
    );
  }
}