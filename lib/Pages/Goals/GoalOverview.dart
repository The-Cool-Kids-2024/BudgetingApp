
import 'package:flutter/widgets.dart';
import 'package:test_flutter/Pages/Goals/GoalObject.dart';

class GoalOverview extends StatefulWidget {
  final GoalObject goalObject;
  const GoalOverview({super.key, required this.goalObject});

  @override
  State<GoalOverview> createState() => _GoalOverviewState(goalObject);
}

class _GoalOverviewState extends State<GoalOverview> {
  GoalObject goalObject;
  _GoalOverviewState(this.goalObject);
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
