import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'package:ecommerce_app/utils/product_card.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();
  List<Product> filteredProducts = List.from(Product.products);

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterProducts);
  }

  void _filterProducts() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      filteredProducts = Product.products
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
      body: Expanded(
        child: filteredProducts.isEmpty
            ? Center(child: Text("No products found"))
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
    );
  }
}
