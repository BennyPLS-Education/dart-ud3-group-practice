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
}
