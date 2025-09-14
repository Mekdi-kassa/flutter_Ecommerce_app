import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  /// Fetches products from remote API
  Future<List<ProductModel>> getProducts();
  
  /// Fetches a single product by ID from remote API
  Future<ProductModel> getProduct(String id);
  
  /// Creates a new product on remote API
  Future<ProductModel> createProduct(ProductModel product);
  
  /// Updates an existing product on remote API
  Future<ProductModel> updateProduct(ProductModel product);
  
  /// Deletes a product from remote API
  Future<void> deleteProduct(String id);
  
  /// Searches products on remote API
  Future<List<ProductModel>> searchProducts(String query);
} 