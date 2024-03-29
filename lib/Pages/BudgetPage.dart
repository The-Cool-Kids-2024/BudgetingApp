import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../CCTheme.dart';
import '../CCComponents.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
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
          CCHeaderContainer("Budget", "Total: -\$59.59"),
          CCContainer("Rent", "\$500.00", textColor: Colors.red),
          CCSpacer(),
          CCContainer("Net Pay", "\$2000.00"),
          CCSpacer(),
          CCContainer("Food", "\$200.00", textColor: Colors.red),
          CCSpacer(),
          CCContainer("Entertainment", "\$59.59", textColor: Colors.red),
          CCSpacer(),
          CCContainer("Entertainment", "\$59.59", textColor: Colors.red),
          CCSpacer(),
          CCHeaderContainer("", ""),
        ],
      )),
    );
  }
}