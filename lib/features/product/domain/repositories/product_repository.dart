import '../entities/product.dart';

abstract class ProductRepository {
  /// Gets all products
  Future<List<Product>> getProducts();
  
  /// Gets a single product by ID
  Future<Product?> getProduct(String id);
  
  /// Creates a new product
  Future<Product> createProduct(Product product);
  
  /// Updates an existing product
  Future<Product> updateProduct(Product product);
  
  /// Deletes a product
  Future<void> deleteProduct(String id);
  
  /// Searches products by query
  Future<List<Product>> searchProducts(String query);
} 