import 'dart:convert';

import 'package:group_practice/models/product.dart';

class ProductsResponse {
  List<Product> products;

  ProductsResponse({
    required this.products,
  });

  factory ProductsResponse.fromRawJson(String str) =>
      ProductsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      ProductsResponse(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}
