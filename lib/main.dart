import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/shop_bloc.dart';

import 'bloc/login_bloc.dart';
import 'screens/screens.dart';

void main() {
  runApp(const App());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShopBloc>(
          create: (context) => ShopBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
      ],
      child: App(),
    );
  }
}

class App extends StatelessWidget {
  const App() : super(key: null);

  // This widget is the root of your application.
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
