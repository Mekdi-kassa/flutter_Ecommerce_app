import 'package:ecommerce_app/features/flutter_Ecommerce_app/presentation/pages/Add_product.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/presentation/pages/Home_page.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/presentation/pages/search.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context)=>HomePage(),
        '/add':(context)=>AddProduct(),
        '/search':(context)=>Search(),
      },
    );
  }
}
