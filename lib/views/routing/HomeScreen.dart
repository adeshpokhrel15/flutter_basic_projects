import 'package:flutter/material.dart';
import 'package:flutter_calculator/views/routing/service/service.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Products Screen'),
          onPressed: () async {
            final products = await ProductService.getProducts();
            Navigator.pushNamed(
              context,
              '/products',
              arguments: products,
            );
          },
        ),
      ),
    );
  }
}
