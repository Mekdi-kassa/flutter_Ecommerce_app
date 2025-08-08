import 'dart:io';
import 'dart:math';

import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/models/Product_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('productModel', () {
    test('from Json returns correct ProductMode', () {
      final json = {
        'name': "Dior",
        'category': "Womens High Heel",
        'description': "limited edition",
        'price': 1000,
        'imageFile': File('best_heel.jpg'),
      };
      final model = ProductModel.fromJson(json);
      expect(model.name, "Dior");
      expect(model.description, 'limited edition');
      expect(model.price, 1000);
    });
    test("tojson rteurn correct map", () {
      final model = ProductModel(
        name: "Dior",
        category: 'Womens High Heel',
        description: "limited edition",
        price: 1000,
        imageFile: File('best_heel.jpg'),
      );
      final json = model.toJson();
      expect(json['name'], "Dior");
      expect(json['description'], "limited edition");
      expect(json['price'], 1000);
    });
  });
}
