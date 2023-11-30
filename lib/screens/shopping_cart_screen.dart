import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/states/states.dart';
import 'package:group_practice/widgets/cart_view.dart';

import '../bloc/bloc.dart';
import '../events/events.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ShopBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cistella'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          BlocBuilder(
            bloc: bloc,
            builder: (context, ShoppingCartState state) {
              return Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Text(
                      '\$${state.totalPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          BlocBuilder(
            bloc: bloc,
            builder: (context, ShoppingCartState state) {
              return Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text(
                    '${state.count}',
                    style: const TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: _body(bloc),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(ShopEventClear());
        },
        child: const Icon(Icons.delete),
      )
    );
  }

  Padding _body(ShopBloc bloc) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, ShoppingCartState state) {
            return CartView(cartState: state);
          },
        ),
      ),
    );
  }
}
