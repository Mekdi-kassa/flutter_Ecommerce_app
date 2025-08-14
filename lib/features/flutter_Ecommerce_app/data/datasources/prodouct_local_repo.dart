
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/models/Product_model.dart';

abstract class ProductLocalDataSource {
  Future<List<ProductModel>> getCachedProducts();
  Future<ProductModel> cacheProduct(int id);
  Future<void> addProduct(ProductModel product);
  Future<void> updateProduct(int id, ProductModel product);
  Future<void> deleteProduct(int id);
}
