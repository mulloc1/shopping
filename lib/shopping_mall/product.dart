class Product {
  final String name;
  final int price;

  Product({
    required String this.name,
    required int this.price,
  });

  Product copyWith({
    String? name,
    int? price,
  }) {
    return Product(
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

}