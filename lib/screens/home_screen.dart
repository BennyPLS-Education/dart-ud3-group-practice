import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/bloc.dart';
import 'package:group_practice/events/events.dart';
import 'package:group_practice/models/models.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
                  var totalProducts = state.getProducts.values.fold(
                      0, (previousValue, element) => previousValue + element);
                  return Text(
                    'Tens ${totalProducts} productes al carro',
                    style: const TextStyle(
                      fontSize: 32.0,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  );
                },
              ),
              const Text("hola"),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Acció quan es polsa el botó d'afegir
          BlocProvider.of<ShopBloc>(context).add(
            ShopEventAdd(
              Product(1, 'hola'),
            ),
          );
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
