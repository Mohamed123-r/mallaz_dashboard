import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/data_analysis_section.dart';
import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/table_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/services/theme_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
    required this.onTapSeeDetails,
    required this.onTapEddDetails,
  });

  final void Function(int id) onTapSeeDetails;
  final void Function(int id) onTapEddDetails;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataAnalysisSection(isDark: isDark),
          SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              spacing: 12,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableSection(
                  isDark: isDark,
                  onTapSeeDetails: onTapSeeDetails,
                  onTapEddDetails: onTapEddDetails,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
