import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev/modules/product.dart';
import 'package:provider/provider.dart';

import '../../widgets/cartItemCard.dart';
import '../../widgets/productCard.dart';
import '../../Provider/cart_provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late double _cartQuantity = 0.0;
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context, listen: false);

    void _deletePoductCart(Product product) {
      setState(() {
        cartProvider.removeFromCart(product);
      });
    }

    void _addToCartQuantity(double number) {
      setState(() {
        _cartQuantity = _cartQuantity + number;
        print(_cartQuantity);
      });
    }

    final String cartQuantity = _cartQuantity.toString();

//-------- à modifier (nom de fonction)-------
    void _minimizeCartQuantity(double number) {
      setState(() {
        _cartQuantity = _cartQuantity - number;
        print(_cartQuantity);
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Your Cart',
            style: TextStyle(color: Colors.black),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 1,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cartProvider.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final product = cartProvider.products[index];
                  return CartItemCard(
                    product: product,
                    onPressed_delete: _deletePoductCart,
                    onPressed_minimize: _minimizeCartQuantity,
                    onPressed_add: _addToCartQuantity,
                  );
                },
              ),
            ),
            Container(
              color: const Color.fromARGB(246, 252, 249, 249),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      Text(
                        'Cart Quantity: ',
                        style: TextStyle(color: Colors.deepOrange),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Chek out"),
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 50),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        primary: Colors.deepOrange.shade300),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
