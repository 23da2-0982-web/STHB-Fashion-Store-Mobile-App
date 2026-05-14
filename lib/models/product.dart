class Product {
  final String id;
  final String categoryId;
  final String brand;
  final String name;
  final double price;
  final String imageUrl;
  final bool isFavorite;
  final double rating;
  final int reviewsCount;
  final String description;
  final List<String> sizes;
  final List<int> colors; // List of Color values (hex ints)

  Product({
    required this.id,
    required this.categoryId,
    required this.brand,
    required this.name,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
    this.rating = 0.0,
    this.reviewsCount = 0,
    this.description = '',
    this.sizes = const [],
    this.colors = const [],
  });

  Product copyWith({
    String? id,
    String? categoryId,
    String? brand,
    String? name,
    double? price,
    String? imageUrl,
    bool? isFavorite,
    double? rating,
    int? reviewsCount,
    String? description,
    List<String>? sizes,
    List<int>? colors,
  }) {
    return Product(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      brand: brand ?? this.brand,
      name: name ?? this.name,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavorite: isFavorite ?? this.isFavorite,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      description: description ?? this.description,
      sizes: sizes ?? this.sizes,
      colors: colors ?? this.colors,
    );
  }
}
