import 'dart:convert';
// File: lib/model/product.dart

class Product {
  final int id;
  final String imageUrl;
  final double rating;
  final String brandName;
  final String itemName;
  final String oldPrice;
  final String newPrice;
  final List<String> colors;
  final List<String> sizes;
  final String genderCategory; // 'Women', 'Men', 'Kids'
  final String mainCategory; // 'Tops', 'Shorts', 'Jeans'
  final List<String> subCategories; // ['T-shirts'], ['Crop tops', 'Casual']
  final String description; 

  const Product({
    required this.id,
    required this.imageUrl,
    required this.rating,
    required this.brandName,
    required this.itemName,
    this.oldPrice = '',
    required this.newPrice,
    this.colors = const [],
    this.sizes = const [],
    required this.genderCategory,
    required this.mainCategory,
    this.subCategories = const [],
    this.description = '', //
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      imageUrl: json['imageUrl'] as String,
      rating: json['rating'] as double,
      brandName: json['brandName'] as String,
      itemName: json['itemName'] as String,
      oldPrice: json['oldPrice'] as String,
      newPrice: json['newPrice'] as String,

      colors: List<String>.from(json['colors'] as List? ?? []),
      sizes: List<String>.from(json['sizes'] as List? ?? []),
      genderCategory: json['genderCategory'] as String,
      mainCategory: json['mainCategory'] as String,
      subCategories: List<String>.from(json['subCategories'] as List? ?? []),
      description: json['description'] as String? ?? '', // Xử lý null
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'rating': rating,
      'brandName': brandName,
      'itemName': itemName,
      'oldPrice': oldPrice,
      'newPrice': newPrice,
      'colors': colors,
      'sizes': sizes,
      'genderCategory': genderCategory,
      'mainCategory': mainCategory,
      'subCategories': subCategories,
      'description': description,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
