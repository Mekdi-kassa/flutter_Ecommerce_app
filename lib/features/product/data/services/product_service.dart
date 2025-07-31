import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/insert_product.dart';
import '../../domain/usecases/update_product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_product.dart';
import '../../domain/usecases/get_products.dart';
import '../../domain/usecases/search_products.dart';
import '../repositories/product_repository_impl.dart';
import '../datasources/product_remote_data_source_impl.dart';
import '../datasources/product_local_data_source_impl.dart';
import '../../../../core/network/network_info_impl.dart';

class ProductService {
  static final ProductService _instance = ProductService._internal();
  factory ProductService() => _instance;
  ProductService._internal();

  // Create dependencies
  final ProductRemoteDataSourceImpl _remoteDataSource = ProductRemoteDataSourceImpl();
  final ProductLocalDataSourceImpl _localDataSource = ProductLocalDataSourceImpl();
  final NetworkInfoImpl _networkInfo = NetworkInfoImpl();
  
  // Create repository with dependencies
  final ProductRepository _repository = ProductRepositoryImpl(
    remoteDataSource: ProductRemoteDataSourceImpl(),
    localDataSource: ProductLocalDataSourceImpl(),
    networkInfo: NetworkInfoImpl(),
  );
  
  // Use cases
  final InsertProduct _insertProduct = InsertProduct(
    ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSourceImpl(),
      localDataSource: ProductLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
    ),
  );
  final UpdateProduct _updateProduct = UpdateProduct(
    ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSourceImpl(),
      localDataSource: ProductLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
    ),
  );
  final DeleteProduct _deleteProduct = DeleteProduct(
    ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSourceImpl(),
      localDataSource: ProductLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
    ),
  );
  final GetProduct _getProduct = GetProduct(
    ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSourceImpl(),
      localDataSource: ProductLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
    ),
  );
  final GetProducts _getProducts = GetProducts(
    ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSourceImpl(),
      localDataSource: ProductLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
    ),
  );
  final SearchProducts _searchProducts = SearchProducts(
    ProductRepositoryImpl(
      remoteDataSource: ProductRemoteDataSourceImpl(),
      localDataSource: ProductLocalDataSourceImpl(),
      networkInfo: NetworkInfoImpl(),
    ),
  );

  // CRUD operations
  Future<Product> insertProduct(Product product) async {
    return await _insertProduct(product);
  }

  Future<Product> updateProduct(Product product) async {
    return await _updateProduct(product);
  }

  Future<void> deleteProduct(String id) async {
    await _deleteProduct(id);
  }

  Future<Product?> getProduct(String id) async {
    return await _getProduct(id);
  }

  Future<List<Product>> getProducts() async {
    return await _getProducts();
  }

  Future<List<Product>> searchProducts(String query) async {
    return await _searchProducts(query);
  }

  // Network simulation methods (for testing)
  void simulateNetworkFailure() {
    _networkInfo.simulateNetworkFailure();
  }

  void simulateNetworkRecovery() {
    _networkInfo.simulateNetworkRecovery();
  }

  // Helper method to convert old Product to new Product entity
  static Product convertToEntity(dynamic oldProduct) {
    return Product(
      id: oldProduct.hashCode.toString(), // Generate ID from hash
      name: oldProduct.name,
      description: oldProduct.description,
      price: oldProduct.price,
      imageUrl: '', // Placeholder for imageUrl
    );
  }
} 