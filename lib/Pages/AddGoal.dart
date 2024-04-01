import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/BudgetingGoal.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/Database.dart';
import 'package:test_flutter/PopUp.dart';
import 'package:test_flutter/User.dart';

class AddGoalPage extends StatefulWidget {
  @override
  State<AddGoalPage> createState() => _SetupGoalPageState();
}

class _SetupGoalPageState extends State<AddGoalPage> {
  DateTime _dt = DateTime.now();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _goalAmountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CCTheme.background,
        appBar: AppBar(
          backgroundColor: CCTheme.background,
          title: Text("New Goal"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              child: TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Goal Name",
                  hintText: "Enter a name for your goal",
                ),
              ),
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _goalAmountController,
              decoration: const InputDecoration(
                labelText: "Goal Amount",
                hintText: "Enter how much you want to save",
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 32),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.centerLeft,
                      child: const Text("Goal End Date")),
                  CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate:
                          DateTime.now().add(const Duration(days: 999999)),
                      onDateChanged: (d) {
                        _dt = d;
                      }),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: CupertinoButton(
                  color: CCTheme.primary,
                  onPressed: () async {
                    print(_dt.toIso8601String());
                    // Error pop up if fields are empty
                    if (_nameController.text.isEmpty ||
                        _goalAmountController.text.isEmpty) {
                      PopUp.showAlertDialog(
                          context, 'Error', 'Input fields may not be empty');
                    } else {
                      final result = await Database.conn.execute(
                        r'INSERT INTO budgeting_goal (user_id, title, goal_date, price) VALUES ($1, $2, $3, $4)',
                        parameters: [
                          User.id,
                          _nameController.text,
                          _dt.toIso8601String(),
                          double.parse(_goalAmountController.text)
                        ],
                      );

                      // If account successfully created, go back to login page
                      if (result.affectedRows == 1) {
                        User.goals.add(BudgetingGoal(_nameController.text, _dt,
                            double.parse(_goalAmountController.text)));

                        Navigator.pop(context);
                      } else {
                        PopUp.showAlertDialog(context, 'Error',
                            'Something went wrong. Please try again.');
                      }
                    }
                  },
                  child: const Text("Save Goal")),
            )
          ],
        ));
  }
}
