import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<T?>? push<T>(Widget child) => navigatorKey.currentState?.push(
  MaterialPageRoute(builder: (context) => child),
);

Future<T?> pushReplacement<T>(Widget child) => Navigator.of(
  navigatorKey.currentContext!,
).pushReplacement(MaterialPageRoute(builder: (context) => child));

Future<void> pushAndRemoveUntil(Widget child) => Navigator.of(
  navigatorKey.currentContext!,
).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => child), (c) => false);

Future<void> pushReplacementNamed(String routeName, {Object? arguments}) async {
  if (navigatorKey.currentContext != null) {
    await Navigator.of(
      navigatorKey.currentContext!,
    ).pushReplacementNamed(routeName, arguments: arguments);
  } else {
    debugPrint("Navigator context is null");
  }
}

Future<void> pushNamed(String routeName, {Object? arguments}) async {
  if (navigatorKey.currentContext != null) {
    await Navigator.of(
      navigatorKey.currentContext!,
    ).pushNamed(routeName, arguments: arguments);
  } else {
    debugPrint("Navigator context is null");
  }
}

Future<void> popAndPushNamed<T>(String routeName) async {
  if (navigatorKey.currentContext != null) {
    await Navigator.of(navigatorKey.currentContext!).popAndPushNamed(routeName);
  } else {
    debugPrint("Navigator context is null");
  }
}

void pop<T>() {
  if (navigatorKey.currentContext != null) {
    Navigator.of(navigatorKey.currentContext!).pop();
  } else {
    debugPrint("Navigator context is null");
  }
}
