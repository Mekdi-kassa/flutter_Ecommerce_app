import 'package:ecommerce_app/pages/Add_product.dart';
import 'package:ecommerce_app/pages/Home_page.dart';
import 'package:ecommerce_app/pages/search.dart';
import 'package:ecommerce_app/pages/view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      routes: {
        '/':(context)=>HomePage(),
        '/add':(context)=>AddProduct(),
        '/search':(context)=>Search(),
      },
    );
  }
}
