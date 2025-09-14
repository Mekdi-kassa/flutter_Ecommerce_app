import '../datasource/product_local_datasource.dart';
import '../datasource/product_remote_datasource.dart';
import 'product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductLocalDataSource localDataSource;
  final ProductRemoteDataSource remoteDataSource;
  final Future<bool> Function() isNetworkAvailable;

  ProductRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.isNetworkAvailable,
  });

  @override
  Future<List<dynamic>> getProducts() async {
    if (await isNetworkAvailable()) {
      return await remoteDataSource.getProducts();
    } else {
      return await localDataSource.getProducts();
    }
  }

  @override
  Future<void> addProduct(dynamic product) async {
    if (await isNetworkAvailable()) {
      await remoteDataSource.addProduct(product);
    } else {
      await localDataSource.addProduct(product);
    }
  }
}
