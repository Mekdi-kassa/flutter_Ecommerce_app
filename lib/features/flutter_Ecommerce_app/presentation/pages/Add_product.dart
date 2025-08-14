import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  // final InsertProduct insertProduct;

  const AddProduct({super.key/*, required this.insertProduct*/});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _description = TextEditingController();
  final TextEditingController _price = TextEditingController();
  final TextEditingController _category = TextEditingController();

  // Uint8List? _webImage;

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

  Future<void> _submitProduct() async {
    // Product submission functionality commented out
  }

  void _clearForm() {
    // Form clearing functionality commented out
  }
  */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADD PRODUCT",
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
          padding: const EdgeInsets.all(16),
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
                        :*/ _buildPlaceholder(),
                  ),
                ),
                const SizedBox(height: 16),
                _buildTextField(_name, "Name", "Enter name"),
                const SizedBox(height: 16),
                _buildTextField(_category, "Category", "Enter category"),
                const SizedBox(height: 16),
                _buildTextField(_description, "Description", "Enter description"),
                const SizedBox(height: 16),
                _buildPriceField(),
                const SizedBox(height: 30),
                _buildActionButton("ADD", () {}, /*_submitProduct*/ Colors.blue),
                const SizedBox(height: 16),
                _buildActionButton("CLEAR", () {}, /*_clearForm*/ Colors.red),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, String errorText) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: controller,
        // validator: (value) => value?.isEmpty ?? true ? errorText : null,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[100],
        ),
      ),
    );
  }

  Widget _buildPriceField() {
    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: _price,
        keyboardType: TextInputType.number,
        // validator: (value) => value?.isEmpty ?? true ? 'Enter price' : null,
        decoration: InputDecoration(
          labelText: "Price",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: Colors.grey[100],
          suffixIcon: const Icon(Icons.attach_money),
        ),
      ),
    );
  }

  Widget _buildActionButton(String text, VoidCallback onPressed, Color color) {
    return SizedBox(
      width: 200,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16,
            fontFamily: 'Poppins',
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.add_a_photo, size: 40, color: Colors.grey),
        SizedBox(height: 8),
        Text('Add Product Image', style: TextStyle(color: Colors.grey)),
      ],
    );
  }
}