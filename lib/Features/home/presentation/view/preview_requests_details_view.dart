import 'package:book_apartment_dashboard/core/utils/app_text_styles.dart';
import 'package:book_apartment_dashboard/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/services/locale_cubit.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_properties/data/models/property_details_model.dart';
import '../../../add_new_properties/presentation/cubit/property_details_cubit.dart';
import '../../../add_new_properties/presentation/cubit/property_details_state.dart';

class PreviewRequestsDetailsView extends StatefulWidget {
  const PreviewRequestsDetailsView({super.key, required this.onTapBack});

  final VoidCallback onTapBack;

  @override
  State<PreviewRequestsDetailsView> createState() =>
      _PreviewRequestsDetailsViewState();
}

class _PreviewRequestsDetailsViewState
    extends State<PreviewRequestsDetailsView> {
  @override
  Widget build(BuildContext context) {
    final isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return BlocBuilder<PropertyDetailsCubit, PropertyDetailsState>(
      builder: (context, state) {
        if (state is PropertyDetailsLoading ||
            state is PropertyDetailsInitial) {
          return CustomLoading();
        }
        if (state is PropertyDetailsFailure) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: widget.onTapBack,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color:
                        isDark
                            ? AppColors.darkModeText
                            : AppColors.lightModeText,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(context, isDark, S.of(context).unitData),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Center(
                          child: Text(
                            "هذه الوحدة غير موجودة",
                            style: TextStyle(
                              color:
                                  isDark
                                      ? AppColors.darkModeText
                                      : AppColors.lightModeText,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (state is PropertyDetailsSuccess) {
          final details = state.details;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: widget.onTapBack,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color:
                        isDark
                            ? AppColors.darkModeText
                            : AppColors.lightModeText,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle(context, isDark, S.of(context).unitData),
                      const SizedBox(height: 8),
                      _unitDetailsCard(context, isDark, details),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return CustomLoading(); // حالة افتراضية إذا لم تتطابق الحالة
      },
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

  Widget _unitDetailsCard(
    BuildContext context,
    bool isDark,
    PropertyDetailsModel details,
  ) {
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
            child:
                details.mainImage.isNotEmpty
                    ? Image.network(
                      details.mainImage,
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => Image.asset(
                            Assets.imagesTest1,
                            fit: BoxFit.cover,
                          ),
                    )
                    : Image.asset(Assets.imagesTest1, fit: BoxFit.cover),
          ),
          const SizedBox(width: 24),
          Expanded(
            flex: 5,
            child: _unitDetailsColumn(context, isDark, details),
          ),
        ],
      ),
    );
  }

  Widget _unitDetailsColumn(
    BuildContext context,
    bool isDark,
    PropertyDetailsModel details,
  ) {
    // تحويل area إلى نص مع وحدة (م²)
    final areaText = '${details.area} م²';
    // تحويل price إلى نص
    final priceText = details.price.toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          details.governorate.isNotEmpty
              ? details.governorate
              : S.of(context).cityCairo,
          style: AppTextStyles.subtitleTitle20pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          details.city.isNotEmpty ? details.city : S.of(context).targetGroup,
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
              details.floor.isNotEmpty
                  ? details.floor
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
              details.rooms.isNotEmpty ? details.rooms : S.of(context).rooms3,
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
                          text:
                              "${details.bathrooms} ${S.of(context).bathroom}",
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
        ),
      ],
    );
  }

  Widget _unitFeaturesColumn(
    BuildContext context,
    bool isDark,
    List<String> features,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconTextRow(
          context: context,
          isDark: isDark,
          asset: Assets.imagesWif,
          text: features.isNotEmpty ? features[0] : S.of(context).freeWifi,
        ),
        const SizedBox(height: 4),
        IconTextRow(
          context: context,
          isDark: isDark,
          asset: Assets.imagesParker,
          text: features.length > 1 ? features[1] : S.of(context).privateGarage,
        ),
        const SizedBox(height: 4),
        IconTextRow(
          context: context,
          isDark: isDark,
          asset: Assets.imagesSecurity,
          text: features.length > 2 ? features[2] : S.of(context).security247,
        ),
      ],
    );
  }

  Widget _unitStatusColumn(BuildContext context, List<String> statuses) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          statuses.isNotEmpty ? statuses[0] : S.of(context).immediateHousing,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          statuses.length > 1 ? statuses[1] : S.of(context).fullyFinished,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          statuses.length > 2 ? statuses[2] : S.of(context).readyForDelivery,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          statuses.length > 3
              ? statuses[3]
              : S.of(context).installmentsAvailable,
          style: AppTextStyles.text14pxRegular(context),
        ),
        const SizedBox(height: 4),
        Text(
          S
              .of(context)
              .downPayment(statuses.length > 4 ? statuses[4] : '500,000'),
          style: AppTextStyles.text14pxRegular(context),
        ),
      ],
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
