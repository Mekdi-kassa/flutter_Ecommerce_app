import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/entites/product.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:typed_data';

class UpdateProduct extends StatefulWidget {
  final Product product;
  
  UpdateProduct({super.key, required this.product});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _name;
  late TextEditingController _description;
  late TextEditingController _price;
  late TextEditingController _category;

  File? _imageFile;
  Uint8List? _webImage;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with existing product data
    _name = TextEditingController(text: widget.product.name);
    _description = TextEditingController(text: widget.product.description);
    _price = TextEditingController(text: widget.product.price.toString());
    _category = TextEditingController(text: widget.product.category);
    
    // Set existing image
    _webImage = widget.product.webImage;
    _imageFile = widget.product.imageFile;
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _price.dispose();
    _category.dispose();
    super.dispose();
  }

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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }

  Future<void> _updateProductData() async {
    print('Update button pressed');
    // Validate form first
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Check if image is selected
    if (_imageFile == null && _webImage == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an image')),
      );
      return;
    }

    try {
      // Create the updated product object
      final updatedProduct = Product(
        name: _name.text.trim(),
        description: _description.text.trim(),
        category: _category.text.trim(),
        price: double.parse(_price.text.trim()),
        webImage: _webImage,
        imageFile: _imageFile,
      );

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product updated successfully!')),
      );

      // Close the screen and return the updated product
      Navigator.pop(context, updatedProduct);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error updating product: ${e.toString()}')),
      );
    }
  }

  void _clearForm() {
    _formKey.currentState?.reset();
    _name.text = widget.product.name;
    _description.text = widget.product.description;
    _price.text = widget.product.price.toString();
    _category.text = widget.product.category;
    setState(() {
      _imageFile = widget.product.imageFile;
      _webImage = widget.product.webImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "U P D A T E - P R O D U C T",
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
                    controller: _category,
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter category'
                        : null,
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
                    validator: (value) => value == null || value.isEmpty
                        ? 'Enter description'
                        : null,
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
                    validator: (value) =>
                        value == null || value.isEmpty ? 'Enter price' : null,
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
                    onPressed: _updateProductData,
                    child: Text(
                      "U p d a t e",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        color: const Color.fromARGB(95, 249, 248, 248),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 200,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: _clearForm,
                    child: Text(
                      "R E S E T",
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
        Text('Update Product Image', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
} 