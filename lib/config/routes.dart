import 'package:draggable_square_dock_view/config/error_screen.dart';
import 'package:draggable_square_dock_view/core/ui/moving_square.dart';
import 'package:draggable_square_dock_view/core/ui/welcome_page.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomePage.routeName:
        return _cupertinoRoute(const WelcomePage());
      case MovingSquareScreen.routeName:
        return _cupertinoRoute(const MovingSquareScreen());
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
