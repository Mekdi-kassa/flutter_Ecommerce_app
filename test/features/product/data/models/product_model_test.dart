import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';

void main() {
  group('ProductModel', () {
    final testProductModel = ProductModel(
      id: '1',
      name: 'Test Product',
      description: 'Test Description',
      price: 99.99,
      imageUrl: 'https://example.com/image.jpg',
    );

    test('should create a ProductModel with correct values', () {
      // Assert
      expect(testProductModel.id, '1');
      expect(testProductModel.name, 'Test Product');
      expect(testProductModel.description, 'Test Description');
      expect(testProductModel.price, 99.99);
      expect(testProductModel.imageUrl, 'https://example.com/image.jpg');
    });

    test('should convert from JSON correctly', () {
      // Arrange
      final json = {
        'id': '2',
        'name': 'JSON Product',
        'description': 'JSON Description',
        'price': 149.99,
        'imageUrl': 'https://example.com/json-image.jpg',
      };

      // Act
      final result = ProductModel.fromJson(json);

      // Assert
      expect(result.id, '2');
      expect(result.name, 'JSON Product');
      expect(result.description, 'JSON Description');
      expect(result.price, 149.99);
      expect(result.imageUrl, 'https://example.com/json-image.jpg');
    });

    test('should convert to JSON correctly', () {
      // Act
      final json = testProductModel.toJson();

      // Assert
      expect(json['id'], '1');
      expect(json['name'], 'Test Product');
      expect(json['description'], 'Test Description');
      expect(json['price'], 99.99);
      expect(json['imageUrl'], 'https://example.com/image.jpg');
    });

    test('should convert from Product entity correctly', () {
      // Arrange
      final product = Product(
        id: '3',
        name: 'Entity Product',
        description: 'Entity Description',
        price: 199.99,
        imageUrl: 'https://example.com/entity-image.jpg',
      );

      // Act
      final result = ProductModel.fromEntity(product);

      // Assert
      expect(result.id, '3');
      expect(result.name, 'Entity Product');
      expect(result.description, 'Entity Description');
      expect(result.price, 199.99);
      expect(result.imageUrl, 'https://example.com/entity-image.jpg');
    });

    test('should convert to Product entity correctly', () {
      // Act
      final entity = testProductModel.toEntity();

      // Assert
      expect(entity.id, '1');
      expect(entity.name, 'Test Product');
      expect(entity.description, 'Test Description');
      expect(entity.price, 99.99);
      expect(entity.imageUrl, 'https://example.com/image.jpg');
    });

    test('should create a copy with updated fields', () {
      // Act
      final updatedModel = testProductModel.copyWith(
        name: 'Updated Product',
        price: 199.99,
      );

      // Assert
      expect(updatedModel.id, '1'); // Should remain the same
      expect(updatedModel.name, 'Updated Product'); // Should be updated
      expect(updatedModel.description, 'Test Description'); // Should remain the same
      expect(updatedModel.price, 199.99); // Should be updated
      expect(updatedModel.imageUrl, 'https://example.com/image.jpg'); // Should remain the same
    });

    test('should handle JSON with numeric price correctly', () {
      // Arrange
      final json = {
        'id': '4',
        'name': 'Numeric Price Product',
        'description': 'Numeric Price Description',
        'price': 299, // Integer instead of double
        'imageUrl': 'https://example.com/numeric-price.jpg',
      };

      // Act
      final result = ProductModel.fromJson(json);

      // Assert
      expect(result.price, 299.0); // Should be converted to double
    });

    test('should return correct string representation', () {
      // Act
      final stringRepresentation = testProductModel.toString();

      // Assert
      expect(stringRepresentation, contains('ProductModel'));
      expect(stringRepresentation, contains('id: 1'));
      expect(stringRepresentation, contains('name: Test Product'));
      expect(stringRepresentation, contains('description: Test Description'));
      expect(stringRepresentation, contains('price: 99.99'));
      expect(stringRepresentation, contains('imageUrl: https://example.com/image.jpg'));
    });

    test('should handle empty strings in JSON', () {
      // Arrange
      final json = {
        'id': '',
        'name': '',
        'description': '',
        'price': 0.0,
        'imageUrl': '',
      };

      // Act
      final result = ProductModel.fromJson(json);

      // Assert
      expect(result.id, '');
      expect(result.name, '');
      expect(result.description, '');
      expect(result.price, 0.0);
      expect(result.imageUrl, '');
    });
  });
} 