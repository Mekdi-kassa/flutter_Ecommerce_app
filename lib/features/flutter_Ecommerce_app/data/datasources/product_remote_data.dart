import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/models/Product_model.dart';

abstract class ProductRemoteData {
  Future<List<ProductModel>> fetchProducts();
  Future<ProductModel> fetchProduct(int id);
  Future<void> newaddProduct(ProductModel product);
  Future<void> fetchupdateProduct(int id, ProductModel product);
  Future<void> fetchdeleteProduct(int id);
}