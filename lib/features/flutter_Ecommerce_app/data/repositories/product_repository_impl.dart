import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/entites/product.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/repositories/product_repo.dart';
import 'package:flutter/material.dart';

class ProductRepositoryImpl implements ProductRepo {
  static final ProductRepositoryImpl _instance = ProductRepositoryImpl._internal();
  
  factory ProductRepositoryImpl() {
    return _instance;
  }
  
  ProductRepositoryImpl._internal();
  
  final List<Product> _product = [];
  
  @override
  Future<void> insertproduct(Product product) async {
    _product.add(product);
    print('Product added to repository. Total products: ${_product.length}');
  }

  @override
  Future<void> updateproduct(int id, Product product) async {
    if (id >= 0 && id < _product.length) {
      _product[id] = product;
    }
  }

  @override
  Future<void> deleteproduct(int id) async {
    final index = id;
    if (index != -1 && index < _product.length) {
      _product.removeAt(index);
    }
  }

  @override
  Future<Product?> getproduct(int id) async {
    try {
      if (id >= 0 && id < _product.length) {
        return _product[id];
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<List<Product>> getAllProducts() async {
    print('Getting all products. Total products: ${_product.length}');
    return List.from(_product);
  }
}
