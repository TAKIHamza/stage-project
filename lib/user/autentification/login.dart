import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final String username = _usernameController.text;
    final String password = _passwordController.text;

    // Prepare the request body
    Map<String, dynamic> requestBody = {
      'username': username,
      'password': password,
    };

    try {
      final response = await http.post(
        Uri.parse('https://your-laravel-api-url.com/api/login'), // Replace with your Laravel API URL
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Si la connexion est réussie, accédez à la page home
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _errorMessage = 'Invalid username or password';
        });
        
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Failed to login. Please try again.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60,),
            
            // logo
            Container(
              width: 115,
              height: 115,
            child: Image.asset("images/MGSOFT.jpg"),
            ),

            SizedBox(height: 30.0),

             // message d'erreur
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
           
           // les inputs 
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 50.0),
            
            // button de login
            Center(
           child: ElevatedButton(
              
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                primary: Color.fromARGB(255, 67, 140, 200)
              ),

              onPressed: _isLoading ? null : _login,
              
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Login'),
                  
            ),
             ),
            SizedBox(height: 16.0),

            

            // button pour naviger à la page de signup
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: Text('Sign up'),
            ),
           
          ],
        ),
      ),
    );
  }
}
