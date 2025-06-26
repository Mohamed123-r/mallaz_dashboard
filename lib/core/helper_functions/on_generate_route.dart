import 'package:flutter/material.dart';

import '../../Features/login/presentation/view/log_in_view.dart';
import '../../Features/main/main_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LogInView.routeName:
      return MaterialPageRoute(builder: (_) => const LogInView());

      case  MainView.routeName:
        return MaterialPageRoute(builder: (_) => const MainView());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
