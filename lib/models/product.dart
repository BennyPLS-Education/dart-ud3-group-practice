class Product {
  final double price;
  final String image;

  Product(this.price, this.image);

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
        image: json["image"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "image": image,
        "price": price,
      };
}
