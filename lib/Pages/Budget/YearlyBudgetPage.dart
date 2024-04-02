import 'package:flutter/material.dart';

class YearlyBudgetPage extends StatelessWidget {
  const YearlyBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold: AppBar, Title, Body
    return Scaffold(
      appBar: AppBar(
        title: const Text('Yearly Budget Page'),
      ),
      // Body: Center, Text
      body: const Center(
        child: Text('Yearly Budget Content'),
      ),
    );
  }
}