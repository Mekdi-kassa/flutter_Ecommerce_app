import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/datasources/product_remote_data.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/models/Product_model.dart';

class ProductRemoteDataImpl implements ProductRemoteData {
  final List<ProductModel> _remoteproduct = [];
  @override
  Future<ProductModel> fetchProduct(int id) async {
 
    if (0 <= id || id < _remoteproduct.length) {
      await Future.delayed(Duration(milliseconds: 500));
      return _remoteproduct[id];
    }
    throw UnimplementedError("incorrect index");
  }

  @override
  Future<void> fetchdeleteProduct(int id) async {

    if (0 <= id || id < _remoteproduct.length) {
      _remoteproduct.removeAt(id);
      return;
    }
    throw UnimplementedError("incorrect index");
  }

  @override
  Future<List<ProductModel>> fetchProducts() async {

    await Future.delayed(Duration(milliseconds: 500));
    return _remoteproduct;
  }

  @override
  Future<void> fetchupdateProduct(int id, ProductModel product) async {

    if (0 <= id || id < _remoteproduct.length) {
      _remoteproduct[id] = product;
    }
    throw UnimplementedError("no such product");
  }

  @override
  Future<void> newaddProduct(ProductModel product) {
    _remoteproduct.add(product);
    throw UnimplementedError();
  }
}
