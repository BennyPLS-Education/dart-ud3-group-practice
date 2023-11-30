import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/bloc.dart';
import 'package:group_practice/events/events.dart';
import 'package:group_practice/states/states.dart';
import 'package:group_practice/widgets/widgets.dart';

import '../routes/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen() : super(key: null);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  StreamSubscription<LoginState>? loginSubscription;

  @override
  void dispose() {
    loginSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final apiProductsBloc = BlocProvider.of<ApiProductsBloc>(context);
    final loginBloc = BlocProvider.of<LoginBloc>(context);
    apiProductsBloc.add(ApiProductsLoaded());

    loginSubscription = loginBloc.stream
        .listen((LoginState state) => _streamListener(state, context));

    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  void _streamListener(LoginState state, BuildContext context) {
    if (!(state.isValid ?? false)) {
      Navigator.of(context).pop();
    }
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: const Text('Inici'),
      automaticallyImplyLeading: false,
      actions: [
        CircleAvatar(
          backgroundColor: Colors.black,
          child: BlocBuilder(
            bloc: BlocProvider.of<ShopBloc>(context),
            builder: (context, ShoppingCartState state) {
              return Text(
                '${state.count}',
                style: const TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
        ),
        IconButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
          ),
          icon: const Icon(Icons.shopping_bag),
          onPressed: () => {
            Navigator.of(context).pushNamed(Location.cart.path),
          },
        ),
      ],
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          BlocProvider.of<LoginBloc>(context).add(LogoutEvent());
        },
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: BlocBuilder(
          bloc: BlocProvider.of<ApiProductsBloc>(context),
          builder: (context, ApiProductsState state) {
            return ProductListView(products: state.getProducts);
          },
        ),
      ),
    );
  }
}
