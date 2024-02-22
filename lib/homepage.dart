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
        title: Image.asset('deliverables/_static/logo-green.png',
            fit: BoxFit.fitHeight),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: "Ethan",
              ),
            ),
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: "Timpe",
              ),
            ),
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: "ethantimpe",
              ),
            ),
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: "timpe.4@wright.edu",
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 34, 203, 67),
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                print('Press');
              },
              child: const Text('Edit'),
            ),
          ],
        )
      ),
      bottomNavigationBar: const GNav(
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
              icon: Icons.perm_identity_rounded,
              text: 'Profile',
            ),
          ]),
    );
  }
}
