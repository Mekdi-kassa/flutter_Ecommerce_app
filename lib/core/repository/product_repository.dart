abstract class ProductRepository {
  Future<List<dynamic>> getProducts();
  Future<void> addProduct(dynamic product);
  // Add more contract methods as needed
}
