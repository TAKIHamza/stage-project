import 'package:flutter/material.dart';
import 'package:flutter_dev/modules/product.dart';

import '../../services/products_services.dart';

import '../../widgets/productCard.dart';

class Products_view extends StatefulWidget {
  @override
  State<Products_view> createState() => _Products_viewState();
}

class _Products_viewState extends State<Products_view> {
  @override
  
  
  List<Product> _filteredProducts = [];
  final TextEditingController _sarchController = TextEditingController();
  ProductsApi productsApi = ProductsApi();
  late List<Product> products;
  
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 0),
          child: TextField(
            onChanged: (value) {
              setState(() {
               
               
                _filteredProducts = products
                    .where((product) => product.title
                        .toLowerCase()
                        .contains(value.toLowerCase()))
                    .toList();
              });
            },
            
            controller: _sarchController,
            decoration: InputDecoration(
              hintText: 'Search products',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                
              ),
            ),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Product>>(
            future: productsApi.fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {

                products = _sarchController.text.isNotEmpty ? _filteredProducts : snapshot.data!;
               
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12.0,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: _sarchController.text.isNotEmpty ? _filteredProducts.length : products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ProductCard(product: products[index]);
                    },
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error} ...'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
