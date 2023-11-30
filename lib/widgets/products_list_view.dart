import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/bloc.dart';
import 'package:group_practice/events/events.dart';
import 'package:group_practice/models/models.dart';

import '../states/states.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;

  const ProductListView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ShopBloc>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        for (var product in products) _productCard(product, bloc),
      ],
    );
  }

  Widget _productCard(Product product, ShopBloc shopBloc) {
    /// return a product card
    /// The card contains the product image, price, and add/remove buttons
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 0),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              product.image,
              height: 100.0,
              width: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              const Text(
                'Price',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  shopBloc.add(ShopEventAdd(product));
                },
              ),
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  shopBloc.add(ShopEventRemove(product));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
