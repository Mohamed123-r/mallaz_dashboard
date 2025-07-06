import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

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
