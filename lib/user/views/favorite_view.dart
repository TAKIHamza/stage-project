import 'package:flutter/material.dart';
import 'package:flutter_dev/modules/product.dart';
import 'package:provider/provider.dart';
import '../../widgets/cartItemFavoite.dart';
import '../../widgets/productCard.dart';
import '../../Provider/cart_provider.dart';
import '../../Provider/favorite_provider.dart';

class Favorite_view extends StatefulWidget {
  const Favorite_view({super.key});

  @override
  State<Favorite_view> createState() => _Favorite_viewState();
}

class _Favorite_viewState extends State<Favorite_view> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<Favorites>(context, listen: false);
    final products = favoriteProvider.products;

    void deletefavoriteProduct(Product product) {
      setState(() {
        favoriteProvider.removeFromFavorites(product);
      });
    }
  
    return Padding(
      padding: EdgeInsets.all(8),
      
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 12.0,
          mainAxisExtent: 240,
         
          

        ),
        itemCount: products.length ,
        itemBuilder: (BuildContext context, int index) {
          
          return CartItemFavorite(product: products[index],onPressed_delete:deletefavoriteProduct ,);
        },
      ),
    );

  }
}
