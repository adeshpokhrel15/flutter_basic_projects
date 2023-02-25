import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/Product.dart';


class ProductService {
  static const String _baseUrl = 'https://mybackendapi.com/api';

  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.parse('$_baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body);
      return json.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }

  static Future<Product> getProductById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/products/$id'));

    if (response.statusCode == 200) {
      final dynamic json = jsonDecode(response.body);
      return Product.fromJson(json);
    } else {
      throw Exception('Failed to load product with ID: $id');
    }
  }
}
