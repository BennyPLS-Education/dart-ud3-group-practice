import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/api_products_bloc.dart';
import 'package:group_practice/bloc/bloc.dart';
import 'package:group_practice/events/api_products_events.dart';
import 'package:group_practice/events/shopping_cart_events.dart';
import 'package:group_practice/models/product.dart';
import 'package:group_practice/states/api_products_state.dart';
import 'package:group_practice/states/states.dart';
import 'package:group_practice/widgets/cart_view.dart';
import 'package:group_practice/widgets/products_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var apiProductsBloc = BlocProvider.of<ApiProductsBloc>(context);
    apiProductsBloc.add(ApiProductsLoaded());
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
      children: [
        SizedBox(
          height: 20,
        ),
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
        SizedBox(
          height: 20,
        ),
        BlocBuilder(
          bloc: BlocProvider.of<ApiProductsBloc>(context),
          builder: (context, ApiProductsState state) {
            return ProductListView(products: state.getProducts);
          },
        ),
        SizedBox(
          height: 20,
        ),
        BlocBuilder(
          bloc: BlocProvider.of<ShopBloc>(context),
          builder: (context, ShoppingCartState state) {
            return CartView(products: state);
          },
        )
      ],
    );
  }
}
