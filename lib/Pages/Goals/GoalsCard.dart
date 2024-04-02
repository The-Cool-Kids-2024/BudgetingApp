import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/CommonWidgets/DollarAmount.dart';
import 'GoalObject.dart';
import 'SetupGoal.dart';

class GoalsCard extends StatefulWidget {
  final GoalObject goalObject;
  final Color backgroundColor;

  const GoalsCard(
      {super.key,
      required this.goalObject,
      this.backgroundColor = CCTheme.accent});

  @override
  State<GoalsCard> createState() =>
      _GoalsCardState(goalObject, backgroundColor);
}

class _GoalsCardState extends State<GoalsCard> {
  GoalObject goalObject;
  final Color backgroundColor;

  _GoalsCardState(this.goalObject, this.backgroundColor);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          var result = Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SetupGoalPage(goalObject: goalObject)));
          result.then((value) => setState(() {
                if (value != null) {
                  goalObject = value;
                }
              }));
        },
        child: Card(
            color: CCTheme.accent,
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(goalObject.name,
                    style: const TextStyle(
                        fontSize: 24, color: CCTheme.background)),
                DollarAmount(
                    amount: goalObject.currentAmount,
                    fontSize: 48,
                    textColor: CCTheme.background),
                Text("By ${DateFormat.yMMMd().format(goalObject.goalEndDate)}",
                    style: TextStyle(fontSize: 12, color: CCTheme.background))
              ],
            )));
  }
}
