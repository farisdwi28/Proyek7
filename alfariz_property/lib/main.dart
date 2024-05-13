// ignore_for_file: unused_field

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Al - Fariz Property"),
          backgroundColor: Colors.amber,
        ),
        body: SingleChildScrollView(
          // Enable scrolling for overflow
          child: Column(
            children: [
              GridView.count(
                // Use GridView.count for grid layout
                shrinkWrap: true, // Prevent excessive empty space below
                physics:
                    const NeverScrollableScrollPhysics(), // Disable scroll within GridView
                crossAxisCount: 2, // Two cards per row
                mainAxisSpacing: 10.0, // Spacing between rows
                crossAxisSpacing: 10.0, // Spacing between cards
                children: List.generate(
                  10,
                  (index) => // Generate 4 cards
                      Card(
                    color: Colors.indigo,
                    child: InkWell(
                      onTap: () {
                        // Handle button press action
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Button Pressed'),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("TESTING ${index + 1}"),
                            const SizedBox(
                                height: 10), // Spacing between text and button
                            // Add an icon (optional)
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: SizedBox(
        height: 70, // Adjust navigation bar height as desired
        child: ClipRRect( // Use ClipRRect for rounded corners
          borderRadius: const BorderRadius.vertical(top: Radius.circular(0)), // Set top corners rounded
          child: Container( // Container for background color
            color: Colors.black87, // Adjust navigation bar color
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Add navigation bar items here
                IconButton(
                  icon: const Icon(Icons.home, color: Colors.amber),
                  onPressed: () {
                    // Handle home button press
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.search, color: Colors.amber),
                  onPressed: () {
                    // Handle search button press
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings, color: Colors.amber),
                  onPressed: () {
                    // Handle settings button press
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}

