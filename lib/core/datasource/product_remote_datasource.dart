class ProductRemoteDataSource {
  final List<dynamic> _remoteProducts = [];

  Future<List<dynamic>> getProducts() async {
    // Simulate remote fetch
    return _remoteProducts;
  }

  Future<void> addProduct(dynamic product) async {
    _remoteProducts.add(product);
  }
}
