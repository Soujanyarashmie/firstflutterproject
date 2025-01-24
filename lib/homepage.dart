import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required String userName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: const Center(
        child: Text(
          'Hi',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
