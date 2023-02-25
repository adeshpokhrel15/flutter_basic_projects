import 'package:flutter/material.dart';

import '../views/calculator/calculator_page.dart';
import '../views/routing/HomeScreen.dart';
import '../views/routing/ProductDetails.dart';
import '../views/routing/ProductsScreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => HomeScreen(),
        '/products':(context)=> ProductsScreen(),
        '/products-screen':(context)=> ProductDetailsScreen(),
      },
      
    );
  }
}
