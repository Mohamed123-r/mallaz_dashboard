import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/view/widgets/actions_section.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/view/widgets/property_details_widget.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/view/widgets/property_gallery.dart';
import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../core/services/theme_cubit.dart';
import '../../../add_new_properties/data/models/property_details_model.dart';


class EditRequestsToAddNewPropertiesDetails extends StatefulWidget {
  final VoidCallback onTapBack;
  final int propertyId;

  const EditRequestsToAddNewPropertiesDetails({
    super.key,
    required this.onTapBack,
    required this.propertyId,
  });

  @override
  State<EditRequestsToAddNewPropertiesDetails> createState() =>
      _EditRequestsToAddNewPropertiesDetailsState();
}

class _EditRequestsToAddNewPropertiesDetailsState
    extends State<EditRequestsToAddNewPropertiesDetails> {
  final TextEditingController _governorateController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _userFullNameController = TextEditingController();
  final TextEditingController _createdAtController = TextEditingController();
  final TextEditingController _propertyTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
}

  @override
  void dispose() {
    _governorateController.dispose();
    _cityController.dispose();
    _userFullNameController.dispose();
    _createdAtController.dispose();
    _propertyTypeController.dispose();
    super.dispose();
  }

  void _saveChanges() {

  }

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
                onPressed: widget.onTapBack,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
                ),
              ),

              Expanded(
                flex: 4,
                child: PropertyDetailsWidget(
                  isDark: isDark,
                  details: PropertyDetailsModel(
                    governorate: _governorateController.text,
                    city: _cityController.text,
                    ownerName: _userFullNameController.text,
                    createdAt: _createdAtController.text,
                    propertyType: _propertyTypeController.text,
                    mainImage: '', // Placeholder, replace with actual data
                    images: [], // Placeholder, replace with actual data
                    ownerImage: '', // Placeholder, replace with actual data
                  ),
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
          ElevatedButton(
            onPressed: _saveChanges,
            child: Text("Save Changes"),
          ),

        ],
      ),
    );
  }
}