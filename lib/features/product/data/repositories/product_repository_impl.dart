import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';
import '../datasources/product_local_data_source.dart';
import '../models/product_model.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/error/failures.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<List<Product>> getProducts() async {
    if (await networkInfo.isConnected) {
      try {
        // Try to get from remote
        final remoteProducts = await remoteDataSource.getProducts();
        // Cache the results locally
        await localDataSource.saveProducts(remoteProducts);
        return remoteProducts.map((model) => model.toEntity()).toList();
      } catch (e) {
        // If remote fails, try local
        final localProducts = await localDataSource.getProducts();
        return localProducts.map((model) => model.toEntity()).toList();
      }
    } else {
      // No internet, use local data
      final localProducts = await localDataSource.getProducts();
      return localProducts.map((model) => model.toEntity()).toList();
    }
  }

  @override
  Future<Product?> getProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        // Try to get from remote
        final remoteProduct = await remoteDataSource.getProduct(id);
        // Cache locally
        await localDataSource.saveProduct(remoteProduct);
        return remoteProduct.toEntity();
      } catch (e) {
        // If remote fails, try local
        final localProduct = await localDataSource.getProduct(id);
        return localProduct?.toEntity();
      }
    } else {
      // No internet, use local data
      final localProduct = await localDataSource.getProduct(id);
      return localProduct?.toEntity();
    }
  }

  @override
  Future<Product> createProduct(Product product) async {
    final productModel = ProductModel.fromEntity(product);
    
    if (await networkInfo.isConnected) {
      try {
        // Create on remote
        final createdProduct = await remoteDataSource.createProduct(productModel);
        // Cache locally
        await localDataSource.saveProduct(createdProduct);
        return createdProduct.toEntity();
      } catch (e) {
        // If remote fails, save locally only
        await localDataSource.saveProduct(productModel);
        return product;
      }
    } else {
      // No internet, save locally only
      await localDataSource.saveProduct(productModel);
      return product;
    }
  }

  @override
  Future<Product> updateProduct(Product product) async {
    final productModel = ProductModel.fromEntity(product);
    
    if (await networkInfo.isConnected) {
      try {
        // Update on remote
        final updatedProduct = await remoteDataSource.updateProduct(productModel);
        // Update locally
        await localDataSource.updateProduct(updatedProduct);
        return updatedProduct.toEntity();
      } catch (e) {
        // If remote fails, update locally only
        await localDataSource.updateProduct(productModel);
        return product;
      }
    } else {
      // No internet, update locally only
      await localDataSource.updateProduct(productModel);
      return product;
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    if (await networkInfo.isConnected) {
      try {
        // Delete from remote
        await remoteDataSource.deleteProduct(id);
        // Delete from local
        await localDataSource.deleteProduct(id);
      } catch (e) {
        // If remote fails, delete locally only
        await localDataSource.deleteProduct(id);
      }
    } else {
      // No internet, delete locally only
      await localDataSource.deleteProduct(id);
    }
  }

  @override
  Future<List<Product>> searchProducts(String query) async {
    if (await networkInfo.isConnected) {
      try {
        // Search on remote
        final remoteProducts = await remoteDataSource.searchProducts(query);
        return remoteProducts.map((model) => model.toEntity()).toList();
      } catch (e) {
        // If remote fails, search locally
        final localProducts = await localDataSource.searchProducts(query);
        return localProducts.map((model) => model.toEntity()).toList();
      }
    } else {
      // No internet, search locally
      final localProducts = await localDataSource.searchProducts(query);
      return localProducts.map((model) => model.toEntity()).toList();
    }
  }
} 