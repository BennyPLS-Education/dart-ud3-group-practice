import 'package:flutter/material.dart';
import 'package:group_practice/models/product.dart';
import 'package:group_practice/states/shopping_cart_state.dart';

class CartView extends StatelessWidget {
  final ShoppingCartState products;

  const CartView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (products.getProducts.isEmpty) {
      return const Text('No hi ha productes al carro');
    }
    var total = products.getProducts.keys
        .map((e) => e.price! * products.getProducts[e]!)
        .reduce((value, element) => value + element);
    return Column(
      children: [
        Row(
          children: [
            for (var product in products.getProducts.keys)
              Column(
                children: [
                  // add network image
                  Image.network(
                    product.image ??
                        '', // Use the image URL from the Product model
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  Text('units: ${products.getProducts[product]}'),
                  Text(
                      'Subtotal: ${product.price! * products.getProducts[product]!}€'),
                ],
              ),
          ],
        ),
        Text('Total: ${total}€'),
      ],
    );
  }
}
