class ProductLocalDataSource {
  final List<dynamic> _localProducts = [];

  Future<List<dynamic>> getProducts() async {
    // Simulate local fetch
    return _localProducts;
  }

  Future<void> addProduct(dynamic product) async {
    _localProducts.add(product);
  }
  
}
