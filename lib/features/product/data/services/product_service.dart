import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../../domain/usecases/insert_product.dart';
import '../../domain/usecases/update_product.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_product.dart';
import '../repositories/product_repository_impl.dart';

class ProductService {
  static final ProductService _instance = ProductService._internal();
  factory ProductService() => _instance;
  ProductService._internal();

  final ProductRepository _repository = ProductRepositoryImpl();
  
  // Use cases
  final InsertProduct _insertProduct = InsertProduct(ProductRepositoryImpl());
  final UpdateProduct _updateProduct = UpdateProduct(ProductRepositoryImpl());
  final DeleteProduct _deleteProduct = DeleteProduct(ProductRepositoryImpl());
  final GetProduct _getProduct = GetProduct(ProductRepositoryImpl());

  // CRUD operations
  Future<void> insertProduct(Product product) async {
    await _insertProduct(product);
  }

  Future<void> updateProduct(Product product) async {
    await _updateProduct(product);
  }

  Future<void> deleteProduct(String id) async {
    await _deleteProduct(id);
  }

  Future<Product?> getProduct(String id) async {
    return await _getProduct(id);
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