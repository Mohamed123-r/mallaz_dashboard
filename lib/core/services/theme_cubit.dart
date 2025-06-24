import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  void toggleTheme(bool isDark) {
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}
// const SizedBox(height: 20),
// Switch(
// value: context.watch<ThemeCubit>().state == ThemeMode.dark,
// onChanged: (value) {
// context.read<ThemeCubit>().toggleTheme(value);
// },
// ),
// const SizedBox(height: 20),