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

enum Location { home, login, cart }

final _routeMap = {
  Location.home: '/',
  Location.login: 'login',
  Location.cart: 'cart',
};

final _routes = <String, WidgetBuilder>{
  '/': (context) => const HomeScreen(),
  'login': (context) => const LoginScreen(),
  'cart': (context) => const ShoppingCartScreen(),
};

Map<String, WidgetBuilder> getRoutes() => _routes;
