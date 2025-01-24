import 'package:first_project/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final username = _usernameController.text;
    final password = _passwordController.text;

    final validUsers = {
      'soujanyamohan00@gmail.com': 'Soujanya',
      'sanjay@gmail.com': 'Sanjay',
    };

    if (validUsers.containsKey(username) && password == '1234') {
      // Navigate to HomePage with the user's name
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(userName: validUsers[username]!),
        ),
      );
    } else {
      // Display error SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Invalid username or password!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void _skipLogin() {
    // Navigate to HomePage as a guest
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>  HomePage(userName: 'Guest')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add image at the top
            Image.asset(
              'assets/image/login_image.jpg', // Replace with your image path
              width: 50,
              height: 50,
            ),
            const SizedBox(height: 16), // Space between image and text fields
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _login,
                  child: const Text('Login'),
                ),
                ElevatedButton(
                  onPressed: _skipLogin,
                  child: const Text('Skip Login'),
                ),
              ],
            ),
            const SizedBox(height: 16), // Space between button and new image
            // Add image below the login button
            Image.asset(
              'assets/image/login_bottom_image.jpg', // Replace with your new image path
              width: 100,
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}


