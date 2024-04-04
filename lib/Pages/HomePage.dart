import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_flutter/CCTheme.dart';
import '../CommonWidgets/CCComponents.dart';
import '../User.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
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
          CCHeaderContainer("Welcome Back,", User.firstName),
          CCContainer("Income", "\$" + User.getIncome().toStringAsFixed(2)),
          CCSpacer(),
          CCContainer("Expenses", "\$ -" + User.getExpenses().toStringAsFixed(2), textColor: Colors.red),
          CCSpacer(),
          CCContainer("Net Balance", "\$${(User.getIncome() - User.getExpenses()).toStringAsFixed(2)}", textColor: Colors.black),
          CCSpacer(),
          CCHeaderContainer("", ""),
        ],
      )),
    );
  }
}
