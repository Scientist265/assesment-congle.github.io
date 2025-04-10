import '/export.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case WelcomePage.routeName:
        return _cupertinoRoute(const WelcomePage());
      case MovingSquareScreen.routeName:
        return _cupertinoRoute(const MovingSquareScreen());
      case DockScreen.routeName:
        return _cupertinoRoute(const DockScreen());
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
