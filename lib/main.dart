import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/api_products_bloc.dart';
import 'package:group_practice/bloc/shop_bloc.dart';
import 'package:group_practice/routes/routes.dart';

import 'bloc/login_bloc.dart';

void main() => runApp(const AppState());

class AppState extends StatelessWidget {
  const AppState() : super(key: null);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<ShopBloc>(
          create: (context) => ShopBloc(),
        ),
        BlocProvider<ApiProductsBloc>(
          create: (context) => ApiProductsBloc(),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App() : super(key: null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App (Bloc Demo)',
      theme: getTheme(),
      routes: getRoutes(),
      initialRoute: Location.login.path,
    );
  }

  getTheme() {
    return ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(
          primary: Colors.redAccent,
        )).copyWith(
      appBarTheme: const AppBarTheme(
        color: Colors.redAccent,
      ),
    );
  }
}
