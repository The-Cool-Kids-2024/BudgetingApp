import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/Pages/Goals/GoalObject.dart';

class SetupGoalPage extends StatefulWidget {
  final GoalObject goalObject;
  const SetupGoalPage({super.key, required this.goalObject});


  @override
  State<SetupGoalPage> createState() => _SetupGoalPageState(goalObject);
}

class _SetupGoalPageState extends State<SetupGoalPage> {



  final GoalObject _goalObject;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _goalAmountController = TextEditingController();
  _SetupGoalPageState(this._goalObject) {
    _nameController.text = _goalObject.name;
    _goalAmountController.text = _goalObject.goalAmount.toString();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CCTheme.background,

      appBar: AppBar(
        backgroundColor: CCTheme.background,
        title: Text((_goalObject.name.isEmpty? "New " : _goalObject.name) + " Goal"),
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
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
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
                    child: const Text("Goal End Date")
                ),
                CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 999999)),
                    onDateChanged: (d) {}
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 128),
            child: CupertinoButton(color: CCTheme.accent, onPressed: () {
              if(_nameController.text.isEmpty || _goalAmountController.text.isEmpty) {
                return;
              }
              _goalObject.name = _nameController.text;
              _goalObject.goalAmount = double.parse(_goalAmountController.text);
              Navigator.pop(context, _goalObject);
            }, child: const Text("Save Goal")),
          )
        ],
      )
    );
  }
}
