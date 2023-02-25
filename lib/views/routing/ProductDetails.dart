import 'package:flutter/material.dart';

import 'models/Product.dart';

class ProductDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final product = ModalRoute.of(context)?.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details Screen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product.imageUrl),
          SizedBox(height: 16),
          Text(
            product.name,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(product.description),
          SizedBox(height: 8      ),
      Text(
        '\$${product.price}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    ],
  ),
);
  }
}
