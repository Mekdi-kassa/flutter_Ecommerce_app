import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/datasources/prodouct_local_repo.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/models/Product_model.dart';

class ProductLocalDataImpl implements ProductLocalDataSource {
  final List<ProductModel> _cache = [];
  @override
  Future<List<ProductModel>> getCachedProduct() async {
    return _cache;
  }

  @override
  Future<List<ProductModel>> getCachedProducts() async {
    return _cache;
  }

  @override
  Future<ProductModel> cacheProduct(int id) async {
    if (0 <= id && id < _cache.length) {
      return _cache[id];
    }
    throw Exception('Product with id $id not found in cache');
  }

  @override
  Future<void> addProduct(ProductModel product) async {
    _cache.add(product);
  }

  @override
  Future<void> updateProduct(int id, ProductModel product) async {
    final index = id;
    if (index != -1) {
      _cache[index] = product;
    }
  }

  @override
  Future<void> deleteProduct(int id) async {
    if (id >= 0 && id < _cache.length) {
      _cache.removeAt(id);
    }
  }
}
