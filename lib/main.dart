import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/shop_bloc.dart';

import 'bloc/login_bloc.dart';
import 'screens/screens.dart';

void main() {
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<LoginBloc>(
        create: (context) => LoginBloc(),
      ),
      BlocProvider<ShopBloc>(
        create: (context) => ShopBloc(),
      ),
    ], child: const App());
  }
}

class App extends StatelessWidget {
  const App() : super(key: null);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App (Bloc Demo)',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const HomeScreen(),
        'logOrReg': (context) => LoginOrRegisterScreen(),
      },
      initialRoute: 'logOrReg',
    );
  }
}
