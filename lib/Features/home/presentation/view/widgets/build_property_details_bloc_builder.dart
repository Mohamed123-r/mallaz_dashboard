import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/section_title.dart';
import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/unit_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/l10n.dart';
import '../../../../add_new_properties/presentation/cubit/property_details_cubit.dart';
import '../../../../add_new_properties/presentation/cubit/property_details_state.dart';
import '../preview_requests_details_view.dart';

class BuildPropertyDetailsBlocBuilder extends StatelessWidget {
  const BuildPropertyDetailsBlocBuilder({
    super.key,
    required this.widget,
    required this.isDark,
  });

  final PreviewRequestsDetailsView widget;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
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
                      SectionTitle(
                        context: context,
                        isDark: isDark,
                        text: S.of(context).unitData,
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Center(
                          child: Text(
                            S.of(context).unit_exist,
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
                      SectionTitle(
                        context: context,
                        isDark: isDark,
                        text: S.of(context).unitData,
                      ),
                      const SizedBox(height: 8),
                      UnitDetailsCard(
                        context: context,
                        isDark: isDark,
                        details: details,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return CustomLoading();
      },
    );
  }
}
