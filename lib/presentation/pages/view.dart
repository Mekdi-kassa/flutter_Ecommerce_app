import 'package:flutter/material.dart';
import 'package:ecommerce_app/domain/entites/product.dart';
import 'package:ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/domain/usecases/delete.dart';
import 'package:ecommerce_app/presentation/pages/update_product.dart';

class ProductView extends StatelessWidget {
  final Product product;
  final VoidCallback? onProductDeleted;
  final Function(Product)? onProductUpdated;

  ProductView({super.key, required this.product, this.onProductDeleted, this.onProductUpdated});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(400), // Sets exact height
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0, // Removes shadow
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black45),
            onPressed: () => Navigator.pop(context),
          ),
          flexibleSpace: Container(
            width: double.infinity, // Full width
            child: product.webImage != null
                ? Image.memory(
                    product.webImage!,
                    fit: BoxFit.cover,
                    height: 400, // Fixed height
                    width: double.infinity, // Full width
                  )
                : product.imageFile != null
                ? Image.file(
                    product.imageFile!,
                    fit: BoxFit.cover,
                    height: 200, // Fixed height
                    width: double.infinity, // Full width
                  )
                : Container(
                    height: 200,
                    width: double.infinity, // Full width
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.image_not_supported,
                      size: 100,
                      color: Colors.grey[600],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                  ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.category,
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        ),
                        SizedBox(height: 4),
                        Text(
                          product.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
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
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
                            Icon(
                              Icons.star,
                              color: const Color.fromARGB(255, 194, 228, 21),
                              size: 16,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Size:",
                    style: TextStyle(fontSize: 10, color: Colors.black),
                  ),
                  SizedBox(height: 8),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Add size options here
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("37"),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("38"),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("39"),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("40"),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("41"),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("42"),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          height: 50,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            margin: EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text("43"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w100,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            // Update functionality
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UpdateProduct(product: product),
                              ),
                            );
                            
                            // If product was updated, call the callback
                            if (result != null && result is Product) {
                              onProductUpdated?.call(result);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Update',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            // Delete functionality
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Delete Product'),
                                  content: Text(
                                    'Are you sure you want to delete this product?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        try {
                                          // Close the dialog first
                                          Navigator.of(context).pop();
                                          
                                          // Show success message
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Product deleted successfully!',
                                              ),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                          
                                          // Navigate back and pass the deleted status
                                          Navigator.of(context).pop('deleted');
                                          
                                          // Call the callback if provided
                                          onProductDeleted?.call();
                                        } catch (e) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              content: Text('Error deleting product: $e'),
                                              backgroundColor: Colors.red,
                                            ),
                                          );
                                        }
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete, color: Colors.white, size: 20),
                              SizedBox(width: 8),
                              Text(
                                'Delete',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
