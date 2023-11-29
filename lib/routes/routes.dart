import 'package:flutter/material.dart';

import '../screens/screens.dart';

extension RoutesExtension on Location {
  static const String fallback = '/';

  /// Returns a `String` representation of the route.
  String get path {
    var route = _routeMap[this];
    if (route == null) return fallback;
    return route;
  }
}

enum Location {
  home,
  logOrReg,
}

final _routeMap = {
  Location.home: '/',
  Location.logOrReg: 'logOrReg',
};

final _routes = <String, WidgetBuilder>{
  '/': (context) => const HomeScreen(),
  'logOrReg': (context) => const LoginScreen(),
};

Map<String, WidgetBuilder> getRoutes() => _routes;
