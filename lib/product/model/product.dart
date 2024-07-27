class Product {
  final String name;
  final String imageUrl;
  final String description;
  final double price;
  final double discountPercentage;

  Product({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.description,
    required this.discountPercentage,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      imageUrl: json['images'][0],
      price: json['price'].toDouble(),
      description: json['description'],
      discountPercentage: json['discountPercentage'].toDouble(),
    );
  }
}
