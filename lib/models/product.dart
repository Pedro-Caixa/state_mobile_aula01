class Product {
  final String name;
  final double price;
  final String description;
  final String image;
  final String category;
  final double rating;
  bool favorite;

  Product({
    required this.name,
    required this.price,
    this.description = '',
    this.image = '',
    this.category = '',
    this.rating = 0.0,
    this.favorite = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    final ratingData = json['rating'];
    final ratingValue = ratingData is Map<String, dynamic>
        ? (ratingData['rate'] as num?)?.toDouble() ?? 0
        : 0;

    return Product(
      name: (json['title'] ?? '') as String,
      price: (json['price'] as num?)?.toDouble() ?? 0,
      description: (json['description'] ?? '') as String,
      image: (json['image'] ?? '') as String,
      category: (json['category'] ?? '') as String,
      rating: ratingValue,
    );
  }
}
