import 'package:flutter/material.dart';
import 'package:group_practice/models/product.dart';
import 'package:group_practice/states/shopping_cart_state.dart';

class CartView extends StatelessWidget {
  final ShoppingCartState cartState;

  const CartView({required this.cartState}) : super(key: null);

  @override
  Widget build(BuildContext context) {
    if (cartState.getProducts.isEmpty) {
      return const Center(
          child: Text(
        'No hi ha productes al cistella.',
        style: TextStyle(fontSize: 18.0),
      ));
    }

    return Column(
      children: [
        for (var product in cartState.getProducts.keys)
          _productCard(product, cartState),
      ],
    );
  }

  Widget _productCard(Product product, ShoppingCartState state) {
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
                'Subtotal',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$${state.subTotal(product).toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Unitats',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${state.getProducts[product]}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
