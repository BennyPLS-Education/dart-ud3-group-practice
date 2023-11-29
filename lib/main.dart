import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/shop_bloc.dart';

import 'bloc/login_bloc.dart';
import 'screens/screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ShopBloc(),
      child: BlocProvider(
        create: (_) => LoginBloc(),
        child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            routes: {
              '/': (context) => const HomeScreen(),
              'logOrReg': (context) => LoginOrRegisterScreen(),
            },
            initialRoute: 'logOrReg'),
      ),
    );
  }
}
