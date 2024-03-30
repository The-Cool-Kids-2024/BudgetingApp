import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/CommonWidgets/DollarAmount.dart';
import 'package:test_flutter/Pages/Goals/GoalObject.dart';

class SetupGoalPage extends StatefulWidget {
  final GoalObject goalObject;
  const SetupGoalPage({super.key, required this.goalObject});


  @override
  State<SetupGoalPage> createState() => _SetupGoalPageState();
}

class _SetupGoalPageState extends State<SetupGoalPage> {
  
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _goalAmountController = TextEditingController();

  late DateTime _goalEndDate;
  late double _amount;

  @override
  void initState() {
    _nameController.text = widget.goalObject.name;
    _goalAmountController.text = widget.goalObject.goalAmount.toString();
    _goalEndDate = widget.goalObject.goalEndDate;
    _amount = widget.goalObject.goalAmount;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CCTheme.background,

      appBar: AppBar(
        backgroundColor: CCTheme.background,
        title: Text("${widget.goalObject.name.isEmpty? "New " : widget.goalObject.name} Goal"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: "Goal Name",
              hintText: "Enter a name for your goal",
            ),

          ),
          TextField(
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            controller: _goalAmountController,
            onChanged: (s) {
              setState(() {
                try {
                  _amount = double.parse(s);
                } catch (e) {
                  _amount = 0;
                }
              });
            },
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
                    initialDate: _goalEndDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 999999)),
                    onDateChanged: (d) {
                      setState(() {
                        _goalEndDate = d;
                      });
                    }
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 32),
            child: Column(
              children: [
                const Text("Your monthly contribution"),
                DollarAmount(amount: CalculateMonthlyContribution())
              ]
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 128),
            child: CupertinoButton(color: CCTheme.accent, onPressed: () {
              if(_nameController.text.isEmpty || _goalAmountController.text.isEmpty) {
                return;
              }
              widget.goalObject.name = _nameController.text;
              widget.goalObject.goalAmount = double.parse(_goalAmountController.text);
              Navigator.pop(context, widget.goalObject);
            }, child: const Text("Save Goal")),
          )
        ],
      )
    );
  }

  double CalculateMonthlyContribution() {
    var start = widget.goalObject.dateCreated;
    var end = _goalEndDate;
    var difference = end.difference(start);
    var months = difference.inDays / 30;
    if (months == 0) {
      return _amount;
    }
    return _amount / months;
  }
}
