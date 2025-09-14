import 'product_local_data_source.dart';
import '../models/product_model.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  // In a real app, this would use SharedPreferences, Hive, or SQLite
  // For now, we'll simulate local storage with in-memory storage
  
  final List<ProductModel> _localProducts = [];

  @override
  Future<List<ProductModel>> getProducts() async {
    // Simulate local storage delay
    await Future.delayed(Duration(milliseconds: 100));
    return List.from(_localProducts);
  }

  @override
  Future<ProductModel?> getProduct(String id) async {
    // Simulate local storage delay
    await Future.delayed(Duration(milliseconds: 50));
    
    try {
      return _localProducts.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> saveProduct(ProductModel product) async {
    // Simulate local storage delay
    await Future.delayed(Duration(milliseconds: 100));
    
    final existingIndex = _localProducts.indexWhere((p) => p.id == product.id);
    if (existingIndex != -1) {
      _localProducts[existingIndex] = product;
    } else {
      _localProducts.add(product);
    }
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    // Simulate local storage delay
    await Future.delayed(Duration(milliseconds: 100));
    
    final index = _localProducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _localProducts[index] = product;
    } else {
      throw Exception('Product not found in local storage');
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    // Simulate local storage delay
    await Future.delayed(Duration(milliseconds: 50));
    
    final initialLength = _localProducts.length;
    _localProducts.removeWhere((p) => p.id == id);
    if (_localProducts.length == initialLength) {
      throw Exception('Product not found in local storage');
    }
  }

  @override
  Future<void> saveProducts(List<ProductModel> products) async {
    // Simulate local storage delay
    await Future.delayed(Duration(milliseconds: 200));
    
    for (final product in products) {
      await saveProduct(product);
    }
  }

  @override
  Future<void> clearProducts() async {
    // Simulate local storage delay
    await Future.delayed(Duration(milliseconds: 50));
    
    _localProducts.clear();
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    // Simulate local storage delay
    await Future.delayed(Duration(milliseconds: 50));
    
    return _localProducts.where((product) =>
      product.name.toLowerCase().contains(query.toLowerCase()) ||
      product.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
} 