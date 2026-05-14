// lib/app/models/product_model.dart

class ProductModel {
  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final int stock;
  final int minStock;
  final String imageUrl;
  final String sku;
  final String unit;
  final bool isActive;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.stock,
    required this.minStock,
    required this.imageUrl,
    required this.sku,
    required this.unit,
    this.isActive = true,
  });

  /// Stock status label
  String get stockStatus {
    if (stock <= 0) return 'Out of Stock';
    if (stock <= minStock) return 'Low Stock';
    return 'In Stock';
  }

  bool get isLowStock => stock <= minStock && stock > 0;
  bool get isOutOfStock => stock <= 0;

  ProductModel copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    double? price,
    int? stock,
    int? minStock,
    String? imageUrl,
    String? sku,
    String? unit,
    bool? isActive,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      minStock: minStock ?? this.minStock,
      imageUrl: imageUrl ?? this.imageUrl,
      sku: sku ?? this.sku,
      unit: unit ?? this.unit,
      isActive: isActive ?? this.isActive,
    );
  }
}