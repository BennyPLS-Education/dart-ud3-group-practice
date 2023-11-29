import 'package:group_practice/models/models.dart';

class ShoppingCartState {
  final Map<Product, int> products;

  ShoppingCartState(this.products);

  factory ShoppingCartState.initial() {
    return ShoppingCartState({});
  }

  Map<Product, int> get getProducts => products;

  ShoppingCartState copyAdd(Product product) {
    Map<Product, int> newProducts = Map.from(products);
    print(newProducts.containsKey(product));
    print(newProducts[product]);
    if (newProducts.containsKey(product)) {
      newProducts[product] = newProducts[product]! + 1;
    } else {
      newProducts[product] = 1;
    }
    return ShoppingCartState(newProducts);
  }

  ShoppingCartState copyRemove(Product product) {
    Map<Product, int> newProducts = Map.from(products);
    if (newProducts.containsKey(product)) {
      if (newProducts[product] == 1) {
        newProducts.remove(product);
      } else {
        newProducts[product] = newProducts[product]! - 1;
      }
    }
    return ShoppingCartState(newProducts);
  }
}
