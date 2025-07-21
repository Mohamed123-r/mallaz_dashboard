import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/unit_details_column.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../generated/assets.dart';
import '../../../../add_new_properties/data/models/property_details_model.dart';

class UnitDetailsCard extends StatelessWidget {
  const UnitDetailsCard({
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
            child: UnitDetailsColumn(
              context: context,
              isDark: isDark,
              details: details,
            ),
          ),
        ],
      ),
    );
  }
}
