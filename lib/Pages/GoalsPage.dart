import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_flutter/BudgetingEntry.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter/CCTheme.dart';
import '../CommonWidgets/CCComponents.dart';
import '../User.dart';

class GoalsPage extends StatefulWidget {
  const GoalsPage({Key? key}) : super(key: key);

  @override
  State<GoalsPage> createState() => _GoalsPageState();
}

class _GoalsPageState extends State<GoalsPage> {
  @override
  Widget build(BuildContext context) {
    Column col = Column(
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
        CCHeaderContainer("Goals:", ""),
        CCSpacer(),
      ],
    );

    final DateFormat formatter = DateFormat('MM/dd/yy');

    for (var goal in User.goals) {
      col.children.add(CCGoalContainer(
          goal.title,
          '\$${goal.amount.toStringAsFixed(2)}',
          '${formatter.format(goal.date)}\nSuggested monthly payment: \$${(goal.amount / (goal.date.difference(DateTime.now()).inDays / 30).ceil()).toStringAsFixed(2)}',
          textColor: CCTheme.accent));
      col.children.add(CCSpacer());
    }

    return Scaffold(
      backgroundColor: CCTheme.background,
      body: SingleChildScrollView(child: col),
    );
  }
}
