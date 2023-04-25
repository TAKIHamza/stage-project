import 'package:flutter/material.dart';
import 'package:flutter_dev/widgets/card.dart';
class Home_view extends StatefulWidget {
  const Home_view({super.key});

  @override
  State<Home_view> createState() => _Home_viewState();
}

class _Home_viewState extends State<Home_view> {
  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(10),
     child: GridView.count(
     
       crossAxisSpacing: 20,
       mainAxisSpacing: 20,
       crossAxisCount: 2,
       children: <Widget> [
         card(), card(),
        
       ],
     ),
    );
  }
}