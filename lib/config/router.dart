import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> pushNamed(String routeName, {Object? arguments}) async {
  if (navigatorKey.currentContext != null) {
    await Navigator.of(
      navigatorKey.currentContext!,
    ).pushNamed(routeName, arguments: arguments);
  } else {
    debugPrint("Navigator context is null");
  }
}
