// product.dart
import 'dart:io';
import 'dart:typed_data';

class Product {
  final String name;
  final String description;
  final String category;
  final double price;
  final Uint8List? webImage; // for web
  final File? imageFile;     // for mobile/desktop
  static final List<Product> products = [];

  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    this.webImage,
    this.imageFile,
  }) {
    products.add(this);
  }

  // Convert to Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'category': category,
      'price': price,
      'image_path': imageFile?.path,
    };
  }

  // Get all products as List<Map>
  static List<Map<String, dynamic>> getAllProducts() {
    return products.map((product) => product.toMap()).toList();
  }
}
