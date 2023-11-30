import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:group_practice/bloc/shop_bloc.dart';
import 'package:group_practice/events/shopping_cart_events.dart';
import 'package:group_practice/models/product.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;

  const ProductListView({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var shopBloc = BlocProvider.of<ShopBloc>(context);
    return Column(
      children: [
        for (var product in products)
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Image.network(
                product.image ?? '', // Use the image URL from the Product model
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              SizedBox(
                width: 20,
              ),
              Text('Price: \$${product.price.toString()}'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  shopBloc.add(ShopEventAdd(product));
                },
              ),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  shopBloc.add(ShopEventRemove(product));
                },
              ),
            ],
          )
      ],
    );
  }
}
