import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/Pages/Goals/GoalsCard.dart';

import 'GoalObject.dart';

class GoalsPage extends StatefulWidget {
  List<GoalObject> goals;
  GoalsPage({super.key, required this.goals});


  @override
  State<GoalsPage> createState() => _GoalsPageState(goals);
}

class _GoalsPageState extends State<GoalsPage> {
  List<GoalObject> goals;
  List<GoalsCard> cards = [];
  _GoalsPageState(this.goals);


  double amount = 10.6;
  @override
  Widget build(BuildContext context) {
    cards.clear();
    for (var element in goals) {
      cards.add(GoalsCard(goalObject: element));
    }

    return GridView.count(crossAxisCount: cards.length, children: cards);
  }
}
