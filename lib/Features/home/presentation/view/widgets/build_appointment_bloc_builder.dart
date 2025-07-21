import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/widgets/custom_loading.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/appointment_cubit.dart';
import '../../cubit/appointment_status.dart';
import '../preview_requests_details_view.dart';
import 'contact_row.dart';

class BuildAppointmentBlocBuilder extends StatelessWidget {
  const BuildAppointmentBlocBuilder({
    super.key,
    required this.widget,
    required this.isDark,
  });

  final PreviewRequestsDetailsView widget;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppointmentDetailsCubit, AppointmentState>(
      builder: (context, state) {
        if (state is AppointmentDetailsLoading) {
          return CustomLoading();
        }
        if (state is AppointmentDetailsFailure) {
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
        if (state is AppointmentDetailsSuccess) {
          final details = state.appointmentDetails;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(
                        context: context,
                        isDark: isDark,
                        text: S.of(context).contactData,
                      ),
                      const SizedBox(height: 8),
                      ContactRow(
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
