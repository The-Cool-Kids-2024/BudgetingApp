import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonthlyBudgetPage extends StatelessWidget {
  const MonthlyBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: AppBar, Title, Body
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Budget Page'),
      ),
      // Body: Center, Text
      body: const Center(
        child: Text('Monthly Budget Content'),
      ),
    );
  }
}