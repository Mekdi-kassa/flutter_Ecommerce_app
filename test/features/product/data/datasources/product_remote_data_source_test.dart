import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/features/product/data/datasources/product_remote_data_source_impl.dart';
import 'package:ecommerce_app/features/product/data/models/product_model.dart';

void main() {
  group('ProductRemoteDataSourceImpl', () {
    late ProductRemoteDataSourceImpl dataSource;

    setUp(() {
      dataSource = ProductRemoteDataSourceImpl();
    });

    test('should create a product successfully', () async {
      // Arrange
      final product = ProductModel(
        id: '1',
        name: 'Test Product',
        description: 'Test Description',
        price: 99.99,
        imageUrl: 'https://example.com/image.jpg',
      );

      // Act
      final result = await dataSource.createProduct(product);

      // Assert
      expect(result.id, '1');
      expect(result.name, 'Test Product');
      expect(result.price, 99.99);
    });

    test('should get products successfully', () async {
      // Arrange
      final product1 = ProductModel(
        id: '1',
        name: 'Product 1',
        description: 'Description 1',
        price: 10.0,
        imageUrl: 'url1',
      );
      final product2 = ProductModel(
        id: '2',
        name: 'Product 2',
        description: 'Description 2',
        price: 20.0,
        imageUrl: 'url2',
      );

      await dataSource.createProduct(product1);
      await dataSource.createProduct(product2);

      // Act
      final results = await dataSource.getProducts();

      // Assert
      expect(results.length, 2);
      expect(results[0].name, 'Product 1');
      expect(results[1].name, 'Product 2');
    });

    test('should get a single product by id', () async {
      // Arrange
      final product = ProductModel(
        id: '3',
        name: 'Single Product',
        description: 'Single Description',
        price: 30.0,
        imageUrl: 'url3',
      );
      await dataSource.createProduct(product);

      // Act
      final result = await dataSource.getProduct('3');

      // Assert
      expect(result.id, '3');
      expect(result.name, 'Single Product');
    });

    test('should throw exception when getting non-existent product', () async {
      // Act & Assert
      expect(
        () => dataSource.getProduct('non-existent'),
        throwsException,
      );
    });

    test('should update product successfully', () async {
      // Arrange
      final product = ProductModel(
        id: '4',
        name: 'Original Name',
        description: 'Original Description',
        price: 40.0,
        imageUrl: 'url4',
      );
      await dataSource.createProduct(product);

      final updatedProduct = ProductModel(
        id: '4',
        name: 'Updated Name',
        description: 'Updated Description',
        price: 50.0,
        imageUrl: 'url4',
      );

      // Act
      final result = await dataSource.updateProduct(updatedProduct);

      // Assert
      expect(result.name, 'Updated Name');
      expect(result.price, 50.0);
    });

    test('should throw exception when updating non-existent product', () async {
      // Arrange
      final product = ProductModel(
        id: '5',
        name: 'Non-existent Product',
        description: 'Description',
        price: 60.0,
        imageUrl: 'url5',
      );

      // Act & Assert
      expect(
        () => dataSource.updateProduct(product),
        throwsException,
      );
    });

    test('should delete product successfully', () async {
      // Arrange
      final product = ProductModel(
        id: '6',
        name: 'To Delete',
        description: 'Description',
        price: 70.0,
        imageUrl: 'url6',
      );
      await dataSource.createProduct(product);

      // Act
      await dataSource.deleteProduct('6');

      // Assert
      final products = await dataSource.getProducts();
      expect(products.length, 0);
    });

    test('should throw exception when deleting non-existent product', () async {
      // Act & Assert
      expect(
        () => dataSource.deleteProduct('non-existent'),
        throwsException,
      );
    });

    test('should search products successfully', () async {
      // Arrange
      final product1 = ProductModel(
        id: '7',
        name: 'Apple iPhone',
        description: 'Smartphone',
        price: 999.0,
        imageUrl: 'url7',
      );
      final product2 = ProductModel(
        id: '8',
        name: 'Samsung Galaxy',
        description: 'Android phone',
        price: 799.0,
        imageUrl: 'url8',
      );
      final product3 = ProductModel(
        id: '9',
        name: 'MacBook Pro',
        description: 'Laptop computer',
        price: 1999.0,
        imageUrl: 'url9',
      );

      await dataSource.createProduct(product1);
      await dataSource.createProduct(product2);
      await dataSource.createProduct(product3);

      // Act
      final results = await dataSource.searchProducts('phone');

      // Assert
      expect(results.length, 2);
      expect(results.any((p) => p.name.contains('iPhone')), true);
      expect(results.any((p) => p.name.contains('Galaxy')), true);
    });
  });
} 