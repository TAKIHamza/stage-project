import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.lightBlueAccent,
            
          ),
          accountName: Text("MG-Soft"),
         accountEmail:Text("mg-soft@gmail.com"),
         currentAccountPicture: CircleAvatar(
          child: ClipOval(child: Image.asset("images/MGSOFT.jpg")),
         ),
        
         ),
        ListTile(
          leading: Icon(Icons.exit_to_app_outlined),
          title: Text("exit"),
          onTap: (){ Navigator.pushNamed(context, '/');},
        )
      ]),

    );
  }
}