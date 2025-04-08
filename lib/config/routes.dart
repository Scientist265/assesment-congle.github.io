import 'package:draggable_square_dock_view/config/error_screen.dart';
import 'package:draggable_square_dock_view/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomePage.routeName:
        return _cupertinoRoute(const WelcomePage());

      default:
        return _cupertinoRoute(
          ErrorScreen(error: 'Wrong Route provided ${settings.name}'),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) =>
      CupertinoPageRoute(builder: (_) => view);

  Routes._();
}

class VerifyEmailArguments {
  final String email;
  final String? password;

  VerifyEmailArguments({required this.email, this.password});
}
