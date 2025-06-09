import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // case OnBoardingView.routeName:
    //   return MaterialPageRoute(builder: (_) => const OnBoardingView());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
