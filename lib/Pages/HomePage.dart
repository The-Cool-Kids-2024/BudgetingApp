import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/Interfaces/IHavePageName.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_flutter/Interfaces/IHavePageName.dart';
import '../CommonWidgets/CCComponents.dart';

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
      backgroundColor: CCTheme.background,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: CCTheme.background,
                    shape: BoxShape.rectangle,
                  ),
                ),
              ],
            ),
          ),
          CCHeaderContainer("Welcome Back,", "Ethan"),
          CCContainer("Income", "\$500.00"),
          CCSpacer(),
          CCContainer("Expenses", "\$300.00"),
          CCSpacer(),
          CCContainer("Budget", ""),
          CCSpacer(),
          CCContainer("Goal", "\$59.59"),
          CCSpacer(),
          CCHeaderContainer("", ""),
        ],
      )),
    );
  }
}
