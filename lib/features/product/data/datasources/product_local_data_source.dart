import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  /// Fetches products from local storage
  Future<List<ProductModel>> getProducts();
  
  /// Fetches a single product by ID from local storage
  Future<ProductModel?> getProduct(String id);
  
  /// Saves a product to local storage
  Future<void> saveProduct(ProductModel product);
  
  /// Updates an existing product in local storage
  Future<void> updateProduct(ProductModel product);
  
  /// Deletes a product from local storage
  Future<void> deleteProduct(String id);
  
  /// Saves multiple products to local storage
  Future<void> saveProducts(List<ProductModel> products);
  
  /// Clears all products from local storage
  Future<void> clearProducts();
  
  /// Searches products in local storage
  Future<List<ProductModel>> searchProducts(String query);
} 