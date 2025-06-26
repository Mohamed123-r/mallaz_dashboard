import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'Features/login/presentation/view/log_in_view.dart';
import 'core/helper_functions/on_generate_route.dart';
import 'core/utils/app_colors.dart';
import 'generated/l10n.dart';
import 'core/services/theme_cubit.dart';
import 'core/services/locale_cubit.dart';

Future<void> main() async {
  // await CacheHelper().init();
  // Bloc.observer = CustomBlocObserver();
  // setupGetIt();
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
        BlocProvider(create: (_) => LocaleCubit()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp(
                theme: ThemeData(
                  fontFamily: 'Montserrat',
                  primaryColor: AppColors.lightModeAccent,
                  scaffoldBackgroundColor: AppColors.lightModeBackground,
                  appBarTheme: AppBarTheme(
                    backgroundColor: AppColors.lightModeBackground,
                    surfaceTintColor: AppColors.lightModeBackground,
                    elevation: 0,
                  ),
                  brightness: Brightness.light,
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(color: AppColors.lightModeText),
                    bodyMedium: TextStyle(color: AppColors.lightModeText),
                    bodySmall: TextStyle(color: AppColors.lightModeText),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightModeButtonsPrimary,
                      foregroundColor: AppColors.white,
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  fontFamily: 'Montserrat',
                  brightness: Brightness.dark,
                  scaffoldBackgroundColor: AppColors.darkModeBackground,
                  primaryColor: AppColors.darkModeAccent,
                  appBarTheme: AppBarTheme(
                    backgroundColor: AppColors.darkModeBackground,
                    surfaceTintColor: AppColors.darkModeBackground,
                    centerTitle: true,
                    elevation: 0,
                  ),
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(color: AppColors.darkModeText),
                    bodyMedium: TextStyle(color: AppColors.darkModeText),
                    bodySmall: TextStyle(color: AppColors.darkModeText),
                  ),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkModeButtonsPrimary,
                      foregroundColor: AppColors.white,
                    ),
                  ),
                ),
                themeMode: themeMode,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                locale: locale,
                onGenerateRoute: onGenerateRoute,
                initialRoute: LogInView.routeName,
              );
            },
          );
        },
      ),
    );
  }
}