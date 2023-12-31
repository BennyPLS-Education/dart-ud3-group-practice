import 'package:group_practice/models/models.dart';

class ShoppingCartState {
  final Map<Product, int> products;

  ShoppingCartState(this.products);

  factory ShoppingCartState.initial() {
    return ShoppingCartState({});
  }

  Map<Product, int> get getProducts => products;

  int get count {
    int count = 0;
    products.forEach((product, quantity) {
      count += quantity;
    });
    return count;
  }

  double get totalPrice {
    double totalPrice = 0;
    products.forEach((product, quantity) {
      totalPrice += product.price * quantity;
    });
    return totalPrice;
  }

  int subTotal(Product product) {
    return product.price * (products[product] ?? 0);
  }

  ShoppingCartState copyAdd(Product product) {
    Map<Product, int> newProducts = Map.from(products);

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
      } else if (newProducts[product]! > 1) {
        newProducts[product] = newProducts[product]! - 1;
      }
    }

    return ShoppingCartState(newProducts);
  }
}
