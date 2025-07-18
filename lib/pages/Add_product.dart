import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:ecommerce_app/utils/product.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _name = TextEditingController();
  TextEditingController _description = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _catagory = TextEditingController();

  File? _imageFile;
  Uint8List? _webImage;
  bool _isLoading = false;

  Future<void> _pickImage() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );
      if (result != null && result.files.single.bytes != null) {
        setState(() {
          _webImage = result.files.single.bytes;
          _imageFile = null;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  Future<void> _submitProduct() async {
    print('Submit button pressed');
    // Validate form first
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Check if image is selected
    if (_imageFile == null && _webImage == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select an image')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      // Create the product object
      final newProduct = Product(
        name: _name.text.trim(),
        description: _description.text.trim(),
        category: _catagory.text.trim(),
        price: double.parse(_price.text.trim()),
        webImage: _webImage,
        imageFile: _imageFile,
      );

      // Add to your products list (assuming Product has a static list)
      Product.products.add(newProduct);

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added successfully!')),
      );

      // Close the screen and return the new product
      Navigator.pop(context, newProduct);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error adding product: ${e.toString()}')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _name.clear();
    _description.clear();
    _price.clear();
    _catagory.clear();
    setState(() {
      _imageFile = null;
      _webImage = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "A D D - P R O D U C T S",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
            fontSize: 18,
            color: Colors.black45,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: _webImage != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(_webImage!, fit: BoxFit.cover),
                          )
                        : _imageFile != null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.file(
                              _imageFile!,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return _buildPlaceholder();
                              },
                            ),
                          )
                        : _buildPlaceholder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: _name,
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter name' : null,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: _catagory,
                    validator: (value) => value == null || value.isEmpty ? 'Enter category' : null,
                    decoration: InputDecoration(
                      labelText: "Category",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: _description,
                    validator: (value) => value == null || value.isEmpty ? 'Enter description' : null,
                    decoration: InputDecoration(
                      labelText: "Descriptions",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: TextFormField(
                    controller: _price,
                    validator: (value) => value == null || value.isEmpty ? 'Enter price' : null,
                    decoration: InputDecoration(
                      labelText: "Price",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      suffixIcon: Icon(Icons.attach_money),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _submitProduct,
                    child: Text(
                      "A d d",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: const Color.fromARGB(95, 249, 248, 248),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _clearForm,
                    child: Text(
                      "C L E A R",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: const Color.fromARGB(96, 255, 255, 255),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 243, 45, 59),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
        SizedBox(height: 8),
        Text('Add Product Image', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}
