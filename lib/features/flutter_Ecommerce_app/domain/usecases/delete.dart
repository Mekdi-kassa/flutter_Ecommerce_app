import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/repositories/product_repo.dart';



class DeleteProduct {
  final ProductRepo repository;
  DeleteProduct(this.repository);
  Future<void> call(int id) => repository.deleteproduct(id);
} 