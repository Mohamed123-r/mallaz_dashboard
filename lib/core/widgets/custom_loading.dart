import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/theme_cubit.dart';
import '../utils/app_colors.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return Center(
      child: SpinKitSpinningLines(
        size: 100.0,
        color:
            isDark
                ? AppColors.darkModeButtonsPrimary
                : AppColors.lightModeButtonsPrimary,
      ),
    );
  }
}
