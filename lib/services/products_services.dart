import 'dart:convert';

import 'package:flutter_dev/modules/product.dart';

import 'package:http/http.dart' as http;

class ProductsApi {
  

  Future<List<Product>> fetchProducts() async {
    try {
      http.Response response =
          await http.get(Uri.parse('https://fakestoreapi.com/products/'));
      if (response.statusCode == 200) {
        String data = response.body;
        var jsonData = jsonDecode(data);
        final List<Product> productList = [];
        for (var p in jsonData) {
          productList.add(Product.fromJson(p));
        }
        return productList.toList();
      } else {
        print('status code = ${response.statusCode}');
        throw Exception('Failed to fetch products');
      }
    } catch (ex) {
      print(ex);
      throw Exception('Failed to fetch products');
    }
  }
}
