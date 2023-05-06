import 'package:flutter/material.dart';
import 'package:flutter_dev/modules/product.dart';

import '../../services/products_services.dart';

import '../../widgets/productCard.dart';

class Home_view extends StatefulWidget {
  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  @override


  ProductsApi productsApi = ProductsApi();

  Widget build(BuildContext context) {
    return FutureBuilder<List<Product>>(
      future: productsApi.fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Product> products = snapshot.data!;
          return Padding(
            padding: EdgeInsets.all(8),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisExtent: 250,
                mainAxisSpacing: 10,
              ),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ProductCard(product: products[index]);
              },
            ),
          );
        }
            else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
         },
      
    );
  }
}
