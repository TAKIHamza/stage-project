import 'package:flutter/material.dart';
import 'package:flutter_dev/user/autentification/login.dart';
import 'package:flutter_dev/user/autentification/signup.dart';
import 'package:flutter_dev/user/views/cart.dart';
import 'package:flutter_dev/user/views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MG-SOFT App',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
        '/home': (context) => HomePage(), 
        '/home/cart': (context) => SpeechToTextScreen(), 
      },
    );
  }
}

