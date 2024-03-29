import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/CommonWidgets/DollarAmount.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({super.key});

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  double amount = 10.6;
  @override
  Widget build(BuildContext context) {
    return GridView.count(crossAxisCount: 2, children:  <Widget>[
      Card(
        color: CCTheme.secondary,
        elevation: 5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DollarAmount(amount: amount, fontSize: 60, textColor: CCTheme.background),
            const Text('Savings', style: TextStyle(fontSize: 24, color: CCTheme.background)),
          ],
        )
        ),
    ]);
  }
}
