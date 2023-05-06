import 'package:flutter/material.dart';
import 'package:flutter_dev/user/views/home_view.dart';
import 'package:flutter_dev/user/views/products_view.dart';

import 'favorite_view.dart';
import 'notification_view.dart';
import 'profile_view.dart';
import '../../widgets/sidebar.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentPage = 0;

class _HomePageState extends State<HomePage> {
  @override

// ---------------- la liste des containers à afficher dans le body -------------------

  final liste = <Widget>[Home_view(),Favorite_view(),Products_view(),Notification_view(),Profile_view()];

//--------------------------------------------------------------------------------------
  Widget build(BuildContext context) {
    return Scaffold(
    
     appBar: AppBar(
      
      backgroundColor: Colors.white,
      elevation: 0.5,
      iconTheme: const IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: (){Navigator.pushNamed(context, '/home/cart');},
      icon: const Icon(Icons.shopping_cart_outlined) , )]
      ),

     drawer: const SideBar() ,

     body:  liste[currentPage], backgroundColor: Colors.white,
     
     bottomNavigationBar: NavigationBar(
        
        backgroundColor: Colors.deepOrangeAccent,
        height: 60,
        
        destinations: const [
          
          NavigationDestination(
            icon: Icon(Icons.home_sharp,color: Colors.white), label: ""),
          NavigationDestination(
              icon: Icon(Icons.favorite,color: Colors.white), label: ""),
          NavigationDestination(
              icon: Icon(Icons.search,color: Colors.white), label: ""),
          NavigationDestination(
              icon: Icon(Icons.notifications,color: Colors.white), label: ""),    
          NavigationDestination(
              icon: Icon(Icons.person,color: Colors.white), label: ""),
        ],
         
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,),

    );
  }
}










