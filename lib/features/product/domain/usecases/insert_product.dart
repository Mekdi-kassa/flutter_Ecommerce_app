import '../entities/product.dart';
import '../repositories/product_repository.dart';

class InsertProduct {
  final ProductRepository repository;
  InsertProduct(this.repository);
  Future<Product> call(Product product) {
    return repository.createProduct(product);
  }
} 