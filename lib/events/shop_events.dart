import 'package:group_practice/models/product.dart';

abstract class ShoppingCartEvents {
  ShoppingCartEvents();
}

class ShopEventAdd extends ShoppingCartEvents {
  final Product product;

  ShopEventAdd(this.product);
}

class ShopEventRemove extends ShoppingCartEvents {
  final Product product;

  ShopEventRemove(this.product);
}
