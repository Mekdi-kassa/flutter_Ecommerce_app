import 'package:flutter/material.dart';

class UpdateProduct extends StatefulWidget {
  // final Product product;
  
  UpdateProduct({super.key/*, required this.product*/});

  @override
  State<UpdateProduct> createState() => _UpdateProductState();
}

class _UpdateProductState extends State<UpdateProduct> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _name;
  late TextEditingController _description;
  late TextEditingController _price;
  late TextEditingController _category;

  // File? _imageFile;
  // Uint8List? _webImage;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with empty values
    _name = TextEditingController(/*text: widget.product.name*/);
    _description = TextEditingController(/*text: widget.product.description*/);
    _price = TextEditingController(/*text: widget.product.price.toString()*/);
    _category = TextEditingController(/*text: widget.product.category*/);
  }

  @override
  void dispose() {
    _name.dispose();
    _description.dispose();
    _price.dispose();
    _category.dispose();
    super.dispose();
  }

  /*
  Future<void> _pickImage() async {
    // Image picking functionality commented out
  }

  Future<void> _updateProductData() async {
    // Product update functionality commented out
  }

  void _clearForm() {
    // Form clearing functionality commented out
  }
  */

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
                  onTap: () {}, // _pickImage,
                  child: Container(
                    width: 400,
                    height: 250,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: /*_webImage != null
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
                        :*/ _buildPlaceholder(),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: TextFormField(
                    controller: _name,
                    // validator: (value) =>
                    //     value == null || value.isEmpty ? 'Enter name' : null,
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
                    // validator: (value) => value == null || value.isEmpty
                    //     ? 'Enter category'
                    //     : null,
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
                    // validator: (value) => value == null || value.isEmpty
                    //     ? 'Enter description'
                    //     : null,
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
                    // validator: (value) =>
                    //     value == null || value.isEmpty ? 'Enter price' : null,
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
                    onPressed: () {}, // _updateProductData,
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
                    onPressed: () {}, // _clearForm,
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