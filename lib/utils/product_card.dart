import 'package:flutter/material.dart';
import 'package:ecommerce_app/utils/product.dart';
import 'package:ecommerce_app/pages/view.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({super.key, required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 400,
      child: Column(
        children: [
          // Image with click navigation
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductView(product: product),
                ),
              );
            },
            child: Container(
              width: 350,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                child: Image.memory(
                  product.webImage!,
                  fit: BoxFit.cover,
                  width: 350,
                  height: 300,
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 80,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 222, 222),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name, 
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 4),
                      Text(
                        product.category,
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold, 
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "(5.0)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(width: 4),
                          Icon(Icons.star, color: const Color.fromARGB(255, 194, 228, 21), size: 16),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}