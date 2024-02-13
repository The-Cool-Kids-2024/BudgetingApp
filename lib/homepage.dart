import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CommonCents'),
        centerTitle: true,
        foregroundColor: Color.fromARGB(255, 34, 203, 67),
      ),
      bottomNavigationBar: GNav(
        activeColor: Color.fromARGB(255, 34, 203, 67),
        color: Color.fromARGB(255, 34, 203, 67),
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.add_circle,
            text: 'Add',
          ),
          GButton(
            icon: Icons.align_vertical_bottom,
            text: 'Metrics',
          ),
          GButton(
            icon: Icons.settings,
            text: 'Settings',
          ),
        ]
      ),
    );
  }
}
