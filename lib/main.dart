import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/database/cache/cache_helper.dart';
import 'core/helper_functions/get_it.dart';
import 'core/services/bloc_opesever.dart';
import 'core/utils/app_colors.dart';

Future<void> main() async {

  await CacheHelper().init();

  Bloc.observer = CustomBlocObserver();
 // setupGetIt();


  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Cairo',
        primaryColor: AppColors.primaryColor,
        scaffoldBackgroundColor: AppColors.primaryColor,
        appBarTheme:  AppBarTheme(
          backgroundColor: AppColors.primaryColor,
          surfaceTintColor: AppColors.primaryColor,
          centerTitle: true,
          elevation: 0,
        ),
      ),
    );
  }
}

