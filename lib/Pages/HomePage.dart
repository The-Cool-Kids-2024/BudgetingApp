

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_flutter/Interfaces/IHavePageName.dart';

class HomePage extends StatefulWidget implements IHavePageName {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

  @override
  String getPageName() => "Common Cents";
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 234, 236, 238),
      body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(161, 139, 175, 1),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              //summery
              //my manu

              Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 231, 230, 216),
                    borderRadius: BorderRadius.circular(16)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Income/Expense',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 34, 203, 67),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 231, 230, 216),
                    borderRadius: BorderRadius.circular(16)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Budget',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 34, 203, 67),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 300,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 231, 230, 216),
                    borderRadius: BorderRadius.circular(16)),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Goal',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 34, 203, 67),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
      bottomNavigationBar: const GNav(
          activeColor: Color.fromARGB(255, 94, 96, 175),
          color: Color.fromARGB(255, 34, 203, 67),
          tabs: [
            GButton(
              icon: Icons.add_circle,
              text: 'Add',
            ),
            GButton(
              icon: Icons.money,
              text: 'Budget',
            ),
            GButton(
              icon: Icons.align_vertical_bottom,
              text: 'Metrics', //income/expence
            ),
            GButton(
              icon: Icons.savings,
              text: 'Goals',
            ),
          ]),
    );
  }
}