import 'package:ecommerce_app/pages/Add_product.dart';
import 'package:ecommerce_app/pages/search.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'package:ecommerce_app/utils/product_card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
              setState(() {
                // This will rebuild the widget and refresh the product list
              });
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Search()),
                    );
                  },
                  child: Icon(Icons.search, color: Colors.black38),
                ),
              ],
            ),
            SizedBox(height: 20),
            // the card of each list
            Expanded(
              child: Product.products.isEmpty
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
                      itemCount: Product.products.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: ProductCard(product: Product.products[index]),
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
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProduct()),
          );
          // Refresh the page when returning from AddProduct
          if (result != null) {
            setState(() {
              // This will rebuild the widget and show the new product
            });
          }
        },
        child: Icon(Icons.add, color: Colors.black45),
      ),
    );
  }
}
