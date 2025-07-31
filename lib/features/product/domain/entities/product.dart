import '../../../../core/entities/base_entity.dart';

class Product extends BaseEntity {
  final String name;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required String id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
  }) : super(id: id);
} 