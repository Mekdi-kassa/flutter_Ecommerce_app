import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/entites/product.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/repositories/product_repo.dart';

class UpdateProduct {
  final ProductRepo repo;
  UpdateProduct(this.repo);
  Future<void> call(int id , Product product) => repo.updateproduct(id,product);
}
