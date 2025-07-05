import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/services/locale_cubit.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/property_details_model.dart';
import '../../data/repo/property_details_repo_impl.dart';
import '../cubit/property_details_cubit.dart';
import '../cubit/property_details_state.dart';

class RequestsToAddNewPropertiesDetails extends StatelessWidget {
  final VoidCallback onTapBack;
  final int propertyId;

  const RequestsToAddNewPropertiesDetails({
    super.key,
    required this.onTapBack,
    required this.propertyId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

        if (state is PropertyDetailsLoading ||
            state is PropertyDetailsInitial) {
          return CustomLoading();
        }
        if (state is PropertyDetailsFailure) {
          return Center(child: Text(state.error));
        }
        if (state is PropertyDetailsSuccess) {
          final details = state.details;

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
                        color:
                            isDark
                                ? AppColors.darkModeText
                                : AppColors.lightModeText,
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: PropertyDetailsWidget(
                        isDark: isDark,
                        details: details,
                      ),
                    ),
                    const SizedBox(width: 36),
                    Expanded(
                      flex: 6,
                      child: PropertyGallery(
                        isDark: isDark,
                        mainImage: details.mainImage,
                        images: details.images,
                      ),
                    ),
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
                          style: AppTextStyles.buttonLarge20pxRegular(
                            context,
                          ).copyWith(color: AppColors.black),
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
                          style: AppTextStyles.buttonLarge20pxRegular(
                            context,
                          ).copyWith(color: AppColors.black),
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
        return const SizedBox.shrink();
      },
    );
  }
}

class PropertyGallery extends StatelessWidget {
  final bool isDark;
  final String mainImage;
  final List<String> images;

  const PropertyGallery({
    super.key,
    required this.isDark,
    required this.mainImage,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    // افضل ترتيب: mainImage, ثم أول صورتين من images
    final displayImages = [
      mainImage,
      if (images.isNotEmpty) images[0] else mainImage,
      if (images.length > 1) images[1] else mainImage,
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
              color:
                  isDark
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
                child: Image.network(
                  displayImages[0],
                  height: 286,
                  fit: BoxFit.cover,
                ),
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
                      displayImages[1],
                      height: 140,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      displayImages[2],
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
            displayImages[0],
            height: 170,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}

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
    return Stack(
      children: [
        // Details Column
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // العنوان
            Text(
              S.of(context).propertyDetails, // العنوان من الداتا
              style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                color:
                    isDark
                        ? AppColors.darkModeButtonsPrimary
                        : AppColors.lightModeButtonsPrimary,
              ),
            ),
            const SizedBox(height: 8),
            // المالك (id فقط لأن اسم المالك غير متوفر في الـAPI)
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: AppColors.graysGray4,
                  child:
                      details.ownerImage.isNotEmpty
                          ? Image.network(details.ownerImage, fit: BoxFit.cover)
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
                  details.ownerName,
                  style: AppTextStyles.buttonLarge20pxRegular(context),
                ),
              ],
            ),
            const SizedBox(height: 8),
            // المحافظة + المدينة
            Text(
              "${details.governorate} ${details.city}",
              style: AppTextStyles.subtitleTitle20pxRegular(context),
            ),
            const SizedBox(height: 4),
            // المساحة - الدور - عدد الغرف
            Row(
              children: [
                SvgPicture.asset(
                  Assets.imagesStraighten,
                  color:
                      isDark ? AppColors.darkModeText : AppColors.lightModeText,
                ),
                const SizedBox(width: 8),
                Text(
                  '${details.area} م²',
                  style: AppTextStyles.text14pxRegular(context),
                ),
                const SizedBox(width: 24),
                SvgPicture.asset(
                  Assets.imagesStairs,
                  color:
                      isDark ? AppColors.darkModeText : AppColors.lightModeText,
                ),
                const SizedBox(width: 8),
                Text(
                  details.floor,
                  style: AppTextStyles.text14pxRegular(context),
                ),
                const SizedBox(width: 24),
                SvgPicture.asset(
                  Assets.imagesDoor,
                  color:
                      isDark ? AppColors.darkModeText : AppColors.lightModeText,
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
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 24,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color:
                    isDark ? AppColors.lightModeText : AppColors.darkModeText,
              ),
              child: Text(
                S.of(context).unitPrice('${details.price}'),
                style: AppTextStyles.buttonLarge20pxRegular(context),
              ),
            ),
            const SizedBox(height: 12),
            // الوصف إذا متاح
            if (details.description != null)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  details.description!,
                  style: AppTextStyles.text14pxRegular(context),
                ),
              ),
            // تفاصيل رئيسية
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
            // نوع الوحدة (شقة/فيلا...الخ)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "${S.of(context).propertyType}: ${details.type}",
                style: AppTextStyles.text14pxRegular(context),
              ),
            ),
            // نوع البيع/الإيجار
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "${S.of(context).forSaleOrRent}: ${details.propertyType}",
                style: AppTextStyles.text14pxRegular(context),
              ),
            ),
            // نوع الإيجار إذا كان متوفر
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
    );
  }
}

class IconTextRow extends StatelessWidget {
  final BuildContext context;
  final bool isDark;
  final String asset;
  final String text;

  const IconTextRow({
    super.key,
    required this.context,
    required this.isDark,
    required this.asset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          asset,
          width: 16,
          color:
              isDark
                  ? AppColors.darkModeButtonsPrimary
                  : AppColors.lightModeButtonsPrimary,
        ),
        const SizedBox(width: 8),
        Text(text, style: AppTextStyles.subtitle16pxRegular(context)),
      ],
    );
  }
}
