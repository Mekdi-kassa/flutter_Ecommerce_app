import 'package:ecommerce_app/feature/flutter_Ecommerce_app/domain/entites/product.dart';
import 'package:ecommerce_app/feature/flutter_Ecommerce_app/domain/repositories/product_repo.dart';

class getProduct {
  final ProductRepo repo;
  getProduct(this.repo);
  Future<void> call(int id) => repo.getproduct(id);
}

class getAllProducts {
  final ProductRepo repo;
  getAllProducts(this.repo);
  Future<List<Product>> call() => repo.getAllProducts();
}
