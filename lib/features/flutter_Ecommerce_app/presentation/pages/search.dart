import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  // final ProductRepositoryImpl productRepository;

  const Search({Key? key/*, required this.productRepository*/}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  // List<Product> allProducts = [];
  // List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    // _searchController.addListener(_filterProducts);
    // _loadProducts();
  }

  /*
  Future<void> _loadProducts() async {
    // Product loading functionality commented out
  }

  void _filterProducts() {
    // Search filtering functionality commented out
  }
  */

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search product name...',
            border: InputBorder.none,
          ),
          onChanged: (value) {
            // Search functionality commented out
          },
        ),
        actions: const [Icon(Icons.list_alt_outlined)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: /*filteredProducts.isEmpty
                  ?*/ Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: Colors.grey[400],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "No products found",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Try a different search term",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    )/*
                  : ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ProductCard(product: filteredProducts[index]),
                      ),
                      scrollDirection: Axis.vertical,
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(bottom: 20),
                    )*/,
            ),
          ],
        ),
      ),
    );
  }
}