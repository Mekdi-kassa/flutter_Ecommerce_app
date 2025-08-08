// product.dart
import 'dart:io';
import 'dart:typed_data';

class Product {
  final String name;
  final String description;
  final String category;
  final double price;
  final Uint8List? webImage; // for web
  final File? imageFile; // for mobile/desktop

  Product({
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    this.webImage,
    this.imageFile,
  });
}
