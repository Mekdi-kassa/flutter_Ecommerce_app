import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/entites/product.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/presentation/widgets/product_card.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/usecases/get.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ProductRepositoryImpl _productRepo = ProductRepositoryImpl();
  final getAllProducts _getAllProducts = getAllProducts(ProductRepositoryImpl());
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    try {
      final products = await _getAllProducts();
      print('Loaded ${products.length} products from repository');
      setState(() {
        _products = products;
      });
    } catch (e) {
      print('Error loading products: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 235, 234, 226),
        leading: Icon(Icons.menu),
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "July 18,2025",
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: CupertinoColors.inactiveGray,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                "Hello,Mekdelawit Abdina",
                style: TextStyle(
                  fontWeight: FontWeight.w200,
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'Poppins',
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 30),
            child: Icon(Icons.notification_add),
          ),
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.black45),
            onPressed: () {
              _loadProducts();
            },
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Avaliable Products",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                    color: CupertinoColors.inactiveGray,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                  child: Icon(Icons.search, color: Colors.black38),
                ),
              ],
            ),
            SizedBox(height: 20),
            // the card of each list
            Expanded(
              child: _products.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.inventory_2_outlined,
                            size: 80,
                            color: Colors.grey[400],
                          ),
                          SizedBox(height: 16),
                          Text(
                            "No Available Products",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[600],
                              fontFamily: 'Poppins',
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Add your first product to get started",
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
                      itemCount: _products.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ProductCard(
                          product: _products[index],
                          onProductDeleted: _loadProducts,
                          onProductUpdated: (updatedProduct) {
                            // Update the product in the list
                            setState(() {
                              _products[index] = updatedProduct;
                            });
                          },
                        ),
                      ),
                      scrollDirection: Axis.vertical,
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 20),
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print('Floating action button pressed - navigating to add page');
          final result = await Navigator.pushNamed(context, '/add');
          print('Returned from add page with result: $result');
          // Refresh the page when returning from AddProduct
          if (result != null) {
            print('Result is not null, reloading products');
            _loadProducts();
          }
        },
        child: Icon(Icons.add, color: Colors.black45),
      ),
    );
  }
}
