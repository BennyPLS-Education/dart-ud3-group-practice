import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/bloc.dart';
import 'package:group_practice/states/states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inici'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // TODO: Logout
              Navigator.of(context).pushReplacementNamed('logOrReg');
            },
          )
        ],
      ),
      body: _body(context),
    );
  }

  Column _body(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocBuilder(
          bloc: BlocProvider.of<LoginBloc>(context),
          builder: (BuildContext context, LoginState state) {
            return Text(
              'Benvingut ${state.getCorreu}!',
              style: const TextStyle(
                fontSize: 32.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
        BlocBuilder(
          bloc: BlocProvider.of<ShopBloc>(context),
          builder: (context, ShoppingCartState state) {
            var totalProducts = state.getProducts.values
                .fold(0, (previousValue, element) => previousValue + element);
            return Text(
              'Tens $totalProducts productes al carro',
              style: const TextStyle(
                fontSize: 32.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            );
          },
        ),
      ],
    );
  }
}
