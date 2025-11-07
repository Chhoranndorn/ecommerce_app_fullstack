class ProductCategory {
  final int id;
  final String name;

  ProductCategory({
    required this.id,
    required this.name,
  });

  factory ProductCategory.fromJson(Map<String, dynamic> json) {
    return ProductCategory(
      id: json['id'],
      name: json['name'],
    );
  }
}

class Product {
  final int id;
  final String name;
  final String? description;
  final String image;
  final double price;
  final int? categoryId;
  final ProductCategory? category;
  final bool isFeatured;

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.image,
    required this.price,
    this.categoryId,
    this.category,
    this.isFeatured = false,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: double.parse(json['price'].toString()),
      categoryId: json['category_id'],
      category: json['category'] != null
          ? ProductCategory.fromJson(json['category'])
          : null,
      isFeatured: json['is_featured'] ?? false,
    );
  }
}
