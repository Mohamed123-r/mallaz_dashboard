import 'package:flutter/material.dart';

import '../../Features/login/presentation/view/log_in_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LogInView.routeName:
      return MaterialPageRoute(builder: (_) => const LogInView());

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
