import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/entites/product.dart';


abstract class ProductRepo {
  Future<void> insertproduct(Product product);
  Future<void> updateproduct(int id,Product product);
  Future<Product?> getproduct(int id);
  Future<void> deleteproduct(int id);
  Future<List<Product>> getAllProducts();
}
