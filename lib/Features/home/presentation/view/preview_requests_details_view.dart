import 'package:book_apartment_dashboard/Features/home/presentation/cubit/appointment_status.dart';
import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/build_appointment_bloc_builder.dart';
import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/build_property_details_bloc_builder.dart';
import 'package:book_apartment_dashboard/core/utils/app_text_styles.dart';
import 'package:book_apartment_dashboard/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_loading.dart';
import '../../../../generated/l10n.dart';
import '../../../add_new_properties/data/models/property_details_model.dart';
import '../../../add_new_properties/presentation/cubit/property_details_cubit.dart';
import '../../../add_new_properties/presentation/cubit/property_details_state.dart';
import '../../data/models/appointment_model.dart';
import '../cubit/appointment_cubit.dart';

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

    return Column(
      children: [
        Expanded(
          child: BuildPropertyDetailsBlocBuilder(
            widget: widget,
            isDark: isDark,
          ),
        ),

        BuildAppointmentBlocBuilder(widget: widget, isDark: isDark),
      ],
    );
  }
}








