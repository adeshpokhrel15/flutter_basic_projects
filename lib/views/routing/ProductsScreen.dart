import 'package:flutter/material.dart';

import 'models/Product.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = ModalRoute.of(context)?.settings.arguments as List<Product>;

    return Scaffold(
      appBar: AppBar(
        title: Text('Products Screen'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text(product.description),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/product-details',
                arguments: product,
              );
            },
          );
        },
      ),
    );
  }
}
