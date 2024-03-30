
import 'package:flutter/widgets.dart';
import 'package:test_flutter/Pages/Goals/GoalObject.dart';

class GoalOverview extends StatefulWidget {
  final GoalObject goalObject;
  const GoalOverview({super.key, required this.goalObject});

  @override
  State<GoalOverview> createState() => _GoalOverviewState();
}

class _GoalOverviewState extends State<GoalOverview> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(widget.goalObject.name),
    );
  }
}
