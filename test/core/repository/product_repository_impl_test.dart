import 'package:flutter_test/flutter_test.dart';
import 'package:ecommerce_app/core/repository/product_repository_impl.dart';
import 'package:ecommerce_app/core/datasource/product_local_datasource.dart';
import 'package:ecommerce_app/core/datasource/product_remote_datasource.dart';

void main() {
  group('ProductRepositoryImpl', () {
    late ProductLocalDataSource localDataSource;
    late ProductRemoteDataSource remoteDataSource;
    late bool networkAvailable;
    late ProductRepositoryImpl repository;

    setUp(() {
    localDataSource = ProductLocalDataSourceImpl();
    remoteDataSource = ProductRemoteDataSource();
    networkAvailable = false;
    repository = ProductRepositoryImpl(
      localDataSource: localDataSource,
      remoteDataSource: remoteDataSource,
      isNetworkAvailable: () async => networkAvailable,
    );
  });

    test('uses local data source when network is unavailable', () async {
      await repository.addProduct('localProduct');
      final products = await repository.getProducts();
      expect(products, contains('localProduct'));
    });

    test('uses remote data source when network is available', () async {
      networkAvailable = true;
      await repository.addProduct('remoteProduct');
      final products = await repository.getProducts();
      expect(products, contains('remoteProduct'));
    });
  });
}
