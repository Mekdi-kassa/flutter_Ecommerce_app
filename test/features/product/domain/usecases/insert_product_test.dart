import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/features/product/domain/entities/product.dart';
import 'package:ecommerce_app/features/product/domain/usecases/insert_product.dart';
import 'package:ecommerce_app/features/product/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/product/data/datasources/product_remote_data_source_impl.dart';
import 'package:ecommerce_app/features/product/data/datasources/product_local_data_source_impl.dart';
import 'package:ecommerce_app/core/network/network_info_impl.dart';

void main() {
  group('InsertProduct', () {
    late ProductRepositoryImpl repository;
    late InsertProduct useCase;
    late ProductRemoteDataSourceImpl remoteDataSource;
    late ProductLocalDataSourceImpl localDataSource;
    late NetworkInfoImpl networkInfo;

    setUp(() {
      remoteDataSource = ProductRemoteDataSourceImpl();
      localDataSource = ProductLocalDataSourceImpl();
      networkInfo = NetworkInfoImpl();
      
      repository = ProductRepositoryImpl(
        remoteDataSource: remoteDataSource,
        localDataSource: localDataSource,
        networkInfo: networkInfo,
      );
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
      final result = await useCase(product);

      // Assert
      expect(result, isNotNull);
      expect(result.name, 'Test Product');
      expect(result.description, 'Test Description');
      expect(result.price, 99.99);
      expect(result.imageUrl, 'https://example.com/image.jpg');
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
      final result1 = await useCase(product1);
      final result2 = await useCase(product2);

      // Assert
      expect(result1, isNotNull);
      expect(result2, isNotNull);
      expect(result1.name, 'Product 1');
      expect(result2.name, 'Product 2');
    });

    test('should work when network is available', () async {
      // Arrange
      networkInfo.setConnected(true);
      final product = Product(
        id: '3',
        name: 'Network Product',
        description: 'Network Description',
        price: 30.0,
        imageUrl: 'url3',
      );

      // Act
      final result = await useCase(product);

      // Assert
      expect(result.name, 'Network Product');
    });

    test('should work when network is unavailable', () async {
      // Arrange
      networkInfo.setConnected(false);
      final product = Product(
        id: '4',
        name: 'Offline Product',
        description: 'Offline Description',
        price: 40.0,
        imageUrl: 'url4',
      );

      // Act
      final result = await useCase(product);

      // Assert
      expect(result.name, 'Offline Product');
    });
  });
} 