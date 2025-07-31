import 'product_remote_data_source.dart';
import '../models/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  // In a real app, this would use HTTP client to call APIs
  // For now, we'll simulate remote operations with in-memory storage
  
  final List<ProductModel> _remoteProducts = [];

  @override
  Future<List<ProductModel>> getProducts() async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 500));
    return List.from(_remoteProducts);
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 300));
    
    final product = _remoteProducts.firstWhere(
      (product) => product.id == id,
      orElse: () => throw Exception('Product not found'),
    );
    return product;
  }

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 400));
    
    // In a real app, this would send POST request to API
    _remoteProducts.add(product);
    return product;
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 400));
    
    final index = _remoteProducts.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _remoteProducts[index] = product;
      return product;
    } else {
      throw Exception('Product not found');
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 300));
    
    final initialLength = _remoteProducts.length;
    _remoteProducts.removeWhere((p) => p.id == id);
    if (_remoteProducts.length == initialLength) {
      throw Exception('Product not found');
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    // Simulate network delay
    await Future.delayed(Duration(milliseconds: 200));
    
    return _remoteProducts.where((product) =>
      product.name.toLowerCase().contains(query.toLowerCase()) ||
      product.description.toLowerCase().contains(query.toLowerCase())
    ).toList();
  }
} 