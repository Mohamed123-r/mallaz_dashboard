import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/view/widgets/actions_section.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/view/widgets/property_details_widget.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/presentation/view/widgets/property_gallery.dart';
import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import '../../../../core/services/theme_cubit.dart';

import '../../data/repo/property_action_repo_impl.dart';

import '../cubit/property_action_cubit.dart';

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
                BlocProvider(
                  create:
                      (context) =>
                          PropertyActionsCubit(PropertyActionsRepoImpl(Dio())),
                  child: ActionsSection(
                    propertyId: propertyId,
                    onTapBack: onTapBack,
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
