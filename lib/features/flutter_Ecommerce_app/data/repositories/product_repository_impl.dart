import 'package:ecommerce_app/core/plateform/network_info.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/datasources/prodouct_local_repo.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/datasources/product_remote_data.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/entites/product.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/repositories/product_repo.dart';
import 'package:flutter/foundation.dart';

class ProductRepositoryImpl implements ProductRepo {
  final ProductLocalDataSource localDataSource;
  final ProductRemoteData remoteDataSource;
  final NetworkInfo networkInfo;
  final ValueNotifier<List<Product>> _productsNotifier = ValueNotifier([]);

  // Public access to products stream
  ValueNotifier<List<Product>> get productsNotifier => _productsNotifier;

  ProductRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<void> insertproduct(Product product) async {
     final newList = [..._productsNotifier.value, product];
     _productsNotifier.value = newList;
    print('Product added. Total: ${_productsNotifier.value.length}');
  }

  @override
  Future<void> updateproduct(int id, Product product) async {
    if (id >= 0 && id < _productsNotifier.value.length) {
      final newList = [..._productsNotifier.value];
      newList[id] = product;
      _productsNotifier.value = newList;
    }
  }

  @override
  Future<void> deleteproduct(int id) async {
    if (id >= 0 && id < _productsNotifier.value.length) {
      final newList = [..._productsNotifier.value];
      newList.removeAt(id);
      _productsNotifier.value = newList;
    }
  }

  @override
  Future<Product?> getproduct(int id) async {
    try {
      if (id >= 0 && id < _productsNotifier.value.length) {
        return _productsNotifier.value[id];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    print('Total products: ${_productsNotifier.value.length}');
    return _productsNotifier.value;
  }
}