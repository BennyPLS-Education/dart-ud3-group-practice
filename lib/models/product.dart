import 'dart:convert';

class Product {
  final int price;
  final String image;

  Product({required this.price, required this.image});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Product && other.price == price && other.image == image;
  }

  @override
  int get hashCode => price.hashCode ^ image.hashCode;

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        image: json["image"] ?? '',
        price: json["price"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "price": price,
      };
}
