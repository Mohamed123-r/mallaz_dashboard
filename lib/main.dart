import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'Features/login/presentation/view/log_in_view.dart';
import 'core/database/cache/cache_helper.dart';
import 'core/helper_functions/get_it.dart';
import 'core/helper_functions/on_generate_route.dart';
import 'core/services/bloc_opesever.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/app_text_styles.dart';
import 'generated/l10n.dart';

Future<void> main() async {
  // await CacheHelper().init();
  //
  // Bloc.observer = CustomBlocObserver();
  // // setupGetIt();
  //
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarIconBrightness: Brightness.dark,
  //   ),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: AppColors.lightModeAccent,
        scaffoldBackgroundColor: AppColors.lightModeBackground,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.lightModeBackground,
          surfaceTintColor: AppColors.lightModeBackground,
          centerTitle: true,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
     locale:  Locale("en") ,
     onGenerateRoute: onGenerateRoute ,
     initialRoute: LogInView.routeName,
    );
  }
}

