class Product {
  final String imageUrl;
  final String name;
  final double price;
  final String origin;
  final String id;
  final String category;

  Product(
      {this.id,
      this.imageUrl,
      this.name,
      this.price,
      this.origin,
      this.category});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        imageUrl: json["imageUrl"],
        name: json["name"],
        id: json["id"],
        price: (json["price"] as num).toDouble(),
        origin: json["origin"],
        category: json["category"]);
  }
}
