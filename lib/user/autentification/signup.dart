import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _c_passwordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';

    Future<void> _signup() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    final String username = _usernameController.text;
    final String password = _passwordController.text;
    final String c_password = _c_passwordController.text;

    // Prepare the request body
    Map<String, dynamic> requestBody = {
      'username': username,
      'password': password,
      'c_password' : c_password,
    };

    try {
      final response = await http.post(
        Uri.parse('https://your-laravel-api-url.com/api/signup'), // Replace with your Laravel API URL for signup
        body: jsonEncode(requestBody),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // If signup is successful, navigate to home page
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        setState(() {
          _errorMessage = 'Failed to sign up. Please try again.';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Failed to sign up. Please try again.';
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
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            SizedBox(height: 50.0),

      // ------------------logo------------------------
            Container(
              width: 115,
              height: 115,
            child: Image.asset("images/MGSOFT.jpg"),
            ),
            SizedBox(height: 20.0),
            

     //-------------------message d'erreur ---------------------
           
            Text(
              _errorMessage,
              style: TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),

    //----------------------- inputs-------------------------------------      
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
            SizedBox(height: 16.0),
            TextField(
              controller: _c_passwordController,
              decoration: InputDecoration(labelText: 'Confirm Password'),
            ),
            SizedBox(height: 50.0),

    //------------ bouton de signup et de retour à la page login---------        
           Center(
           child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                primary: Color.fromARGB(255, 67, 140, 200)
              ),
              onPressed: _isLoading ? null : _signup,
              child: _isLoading
                  ? CircularProgressIndicator()
                  : Text('Sign up'),
            ),),
            SizedBox(height: 16.0),
            
            // pour le retour à la page de login 
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Back to Login'),
            ),
          ],
        ),
      ),
    );
  }
}

