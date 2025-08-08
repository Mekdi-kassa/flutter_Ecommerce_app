import 'package:flutter/material.dart';
import 'package:ecommerce_app/feature/flutter_Ecommerce_app/domain/entites/product.dart';
import 'package:ecommerce_app/feature/flutter_Ecommerce_app/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/feature/flutter_Ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/feature/flutter_Ecommerce_app/domain/usecases/get.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];
  final getAllProducts _getAllProducts = getAllProducts(ProductRepositoryImpl());

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterProducts);
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final products = await _getAllProducts();
      setState(() {
        allProducts = products;
        filteredProducts = List.from(allProducts);
      });
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  void _filterProducts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredProducts = allProducts
          .where((product) => product.name.toLowerCase().contains(query))
          .toList();
    });
  }

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
          decoration: InputDecoration(
            hintText: 'Search product name...',
            border: InputBorder.none,
          ),
        ),
        actions: [
          Icon(Icons.list_alt_outlined)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: filteredProducts.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80,
                            color: Colors.grey[400],
                          ),
                          SizedBox(height: 16),
                          Text(
                            "No products found",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Try a different search term",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[500],
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ProductCard(product: filteredProducts[index]),
                      ),
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 20),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
