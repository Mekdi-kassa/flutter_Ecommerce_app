
import 'package:ecommerce_app/feature/flutter_Ecommerce_app/domain/entites/product.dart';
import 'package:ecommerce_app/feature/flutter_Ecommerce_app/domain/repositories/product_repo.dart';

class InsertProduct {
  final ProductRepo repo;
  InsertProduct(this.repo);
  Future<void> call(Product product) {
    return repo.insertproduct(product);
  }
}
