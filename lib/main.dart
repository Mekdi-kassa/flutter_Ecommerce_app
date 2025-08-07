import 'package:ecommerce_app/pages/Add_product.dart';
import 'package:ecommerce_app/pages/Home_page.dart';
import 'package:ecommerce_app/pages/search.dart';
import 'package:ecommerce_app/pages/edit_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/auth/presentation/pages/splash_screen.dart';
import 'features/auth/presentation/pages/sign_in_page.dart';
import 'features/auth/presentation/pages/sign_up_page.dart';
import 'features/auth/presentation/pages/home_page.dart' as auth_home;
import 'features/auth/presentation/providers/auth_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/signin': (context) => SignInPage(),
          '/signup': (context) => SignUpPage(),
          '/home': (context) => auth_home.HomePage(),
          '/add': (context) => AddProduct(),
          '/search': (context) => Search(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(builder: (_) => SplashScreen()),
      ),
    );
  }
}
