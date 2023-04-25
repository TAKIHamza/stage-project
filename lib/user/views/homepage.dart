import 'package:flutter/material.dart';
import 'package:flutter_dev/user/views/home_view.dart';

import 'sidebar.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int currentPage = 0;

class _HomePageState extends State<HomePage> {
  @override

// ---------------- la liste des containers à afficher dans le body -------------------

  final liste = <Widget>[Home_view(),Home_view(),Home_view(),Home_view(),Home_view()];

//--------------------------------------------------------------------------------------
  Widget build(BuildContext context) {
    return Scaffold(
    
     appBar: AppBar(
      
      backgroundColor: Colors.white,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black),
      actions: [IconButton(onPressed: (){Navigator.pushNamed(context, '/home/cart');},
      icon: Icon(Icons.shopping_basket_rounded) , )]
      ),

     drawer: const SideBar() ,

     body:  liste[currentPage], backgroundColor: Colors.white,
     
     bottomNavigationBar: NavigationBar(

        backgroundColor: Colors.white,
        height: 60,
        
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_sharp,color: Colors.grey), label: ""),
          NavigationDestination(
              icon: Icon(Icons.favorite,color: Colors.grey), label: ""),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart,color: Colors.grey), label: ""),
          NavigationDestination(
              icon: Icon(Icons.notifications,color: Colors.grey), label: ""),    
          NavigationDestination(
              icon: Icon(Icons.person,color: Colors.grey), label: ""),
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










