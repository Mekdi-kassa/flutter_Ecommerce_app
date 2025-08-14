// product.dart
import 'dart:io';
import 'dart:typed_data';

class ProductModel {
  final String name;
  final String description;
  final String category;
  final double price;
  final Uint8List? webImage; // for web
  final File? imageFile;
  ProductModel({
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageFile,
    this.webImage,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      category: json['category'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      imageFile: json['imageFile'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'category': category,
      'description': description,
      'price': price,
      'imageFile': imageFile,
    };
  }
}
// this logic is to change it into json that's all 
