import 'package:shared_preferences/shared_preferences.dart';

abstract class ProductLocalDataSource {
  Future<List<String>> getProducts();
  Future<void> addProduct(String product);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  static const String _productsKey = 'products';

  @override
  Future<List<String>> getProducts() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_productsKey) ?? [];
  }

  @override
  Future<void> addProduct(String product) async {
    final prefs = await SharedPreferences.getInstance();
    final products = prefs.getStringList(_productsKey) ?? [];
    products.add(product);
    await prefs.setStringList(_productsKey, products);
  }
}
