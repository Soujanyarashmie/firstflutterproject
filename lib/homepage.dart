import 'package:first_project/profilepage.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  final String userName;

  const HomePage({
    super.key,
    required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    // List of image URLs or local asset paths for the carousel
    final List<String> imagePaths = [
      'assets/image/nature1.jpg', // Replace with your asset path
      'assets/image/nature2.jpg', // Replace with your asset path
      'assets/image/nature3.jpg', // Replace with your asset path
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.only(),
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Text(
                        userName[0]
                            .toUpperCase(), // Get the first letter of the username
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Navigate to settings or perform actions
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                Navigator.pop(context); // Return to login page
              },
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Hi $userName', // Display the user's email address
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          CarouselSlider(
            items: imagePaths.map((path) {
              return Builder(
                builder: (BuildContext context) {
                  return Image.asset(
                    path,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  );
                },
              );
            }).toList(),
            options: CarouselOptions(
              height: 200, // Height of the carousel
              autoPlay: true, // Enable auto-play
              autoPlayInterval:
                  const Duration(seconds: 2), // Change slide every 2 seconds
              enlargeCenterPage: true, // Enlarge the current image
              viewportFraction:
                  0.8, // Set the fraction of the viewport visible for each slide
            ),
          ),
        ],
      ),
    );
  }
}
