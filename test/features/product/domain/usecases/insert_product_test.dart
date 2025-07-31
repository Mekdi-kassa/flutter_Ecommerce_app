import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/insert_product.dart';
import 'package:ecommerce_app/features/product/data/repositories/product_repository_impl.dart';

void main() {
  group('InsertProduct', () {
    late ProductRepositoryImpl repository;
    late InsertProduct useCase;

    setUp(() {
      repository = ProductRepositoryImpl();
      useCase = InsertProduct(repository);
    });

    test('should insert a product successfully', () async {
      // Arrange
      final product = Product(
        id: '1',
        name: 'Test Product',
        description: 'Test Description',
        price: 99.99,
        imageUrl: 'https://example.com/image.jpg',
      );

      // Act
      await useCase(product);

      // Assert
      final retrievedProduct = await repository.getProduct('1');
      expect(retrievedProduct, isNotNull);
      expect(retrievedProduct!.name, 'Test Product');
      expect(retrievedProduct.description, 'Test Description');
      expect(retrievedProduct.price, 99.99);
      expect(retrievedProduct.imageUrl, 'https://example.com/image.jpg');
    });

    test('should handle multiple product insertions', () async {
      // Arrange
      final product1 = Product(
        id: '1',
        name: 'Product 1',
        description: 'Description 1',
        price: 10.0,
        imageUrl: 'url1',
      );
      final product2 = Product(
        id: '2',
        name: 'Product 2',
        description: 'Description 2',
        price: 20.0,
        imageUrl: 'url2',
      );

      // Act
      await useCase(product1);
      await useCase(product2);

      // Assert
      final retrieved1 = await repository.getProduct('1');
      final retrieved2 = await repository.getProduct('2');
      
      expect(retrieved1, isNotNull);
      expect(retrieved2, isNotNull);
      expect(retrieved1!.name, 'Product 1');
      expect(retrieved2!.name, 'Product 2');
    });
  });
} 