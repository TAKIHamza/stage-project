import 'package:flutter/material.dart';

import '../../services/products_services.dart';

class Notification_view extends StatefulWidget {
  const Notification_view({super.key});

  @override
  State<Notification_view> createState() => _Notification_viewState();
}

class _Notification_viewState extends State<Notification_view> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () async {
            ProductsApi productsApi = ProductsApi();
            var products = await productsApi.fetchProducts();
            for (var e in products) {
              print(e.title);
            }
            
          },
          child: Text("show")),
    );
  }
}
