import 'package:group_practice/models/product.dart';

class ApiProductsState {
  final List<Product> _products;

  ApiProductsState(this._products);

  ApiProductsState.initial() : this([]);

  get getProducts => _products;
}
