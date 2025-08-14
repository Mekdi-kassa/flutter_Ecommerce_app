import 'package:ecommerce_app/core/plateform/network_info.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/repositories/product_local_data_impl.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/repositories/product_remote_data_impl.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/data/repositories/product_repository_impl.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/domain/usecases/Add.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/presentation/pages/Add_product.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/presentation/pages/Home_page.dart';
import 'package:ecommerce_app/features/flutter_Ecommerce_app/presentation/pages/search.dart';
import 'package:flutter/material.dart';

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async => true; // Mock as connected
}

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
        '/': (context) => HomePage(
          // productRepo: ProductRepositoryImpl(
          //   localDataSource: ProductLocalDataImpl(),
          //   remoteDataSource: ProductRemoteDataImpl(),
          //   networkInfo: NetworkInfoImpl(),
          // ),
        ),
        '/add': (context) => AddProduct(
            // productRepo: ProductRepositoryImpl(
          //   localDataSource: ProductLocalDataImpl(),
          //   remoteDataSource: ProductRemoteDataImpl(),
          //   networkInfo: NetworkInfoImpl(),
          // ),
        ),
        '/search': (context) => Search(
          // productRepository: ProductRepositoryImpl(
          //   localDataSource: ProductLocalDataImpl(),
          //   remoteDataSource: ProductRemoteDataImpl(),
          //   networkInfo: NetworkInfoImpl(),
          // ),
        ),
      },
    );
  }
}
