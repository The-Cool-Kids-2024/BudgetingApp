import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/BudgetingEntry.dart';
import 'package:test_flutter/CCTheme.dart';
import 'package:test_flutter/CommonWidgets/CCComponents.dart';
import 'package:test_flutter/Database.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../PopUp.dart';
import '../User.dart';

class AddEntryPage extends StatefulWidget {
  const AddEntryPage({super.key});

  @override
  State<AddEntryPage> createState() => _SetupGoalPageState();
}

class _SetupGoalPageState extends State<AddEntryPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  int _typeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CCTheme.background,
        appBar: AppBar(
          backgroundColor: CCTheme.background,
          title: Text("New Budgeting Entry"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              child: TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: "Title",
                  hintText: "Enter a title for your entry",
                ),
              ),
            ),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              controller: _amountController,
              decoration: const InputDecoration(
                labelText: "Amount",
              ),
            ),
            CCSpacer(),
            ToggleSwitch(
              minWidth: 200.0,
              minHeight: 45.0,
              fontSize: 16.0,
              initialLabelIndex: 0,
              activeBgColor: [CCTheme.primary],
              activeFgColor: Colors.white,
              inactiveBgColor: CCTheme.complement,
              inactiveFgColor: Colors.grey[900],
              totalSwitches: 2,
              labels: ['Income', 'Expense'],
              onToggle: (index) {
                _typeIndex = index!;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 128),
              child: CupertinoButton(
                  color: CCTheme.primary,
                  onPressed: () async {
                    if (_titleController.text.isEmpty ||
                        _amountController.text.isEmpty) {
                      PopUp.showAlertDialog(context, 'Error',
                          'All input fields must be filled out');
                    } else {
                      EntryType _type = _typeIndex == 0
                          ? EntryType.INCOME
                          : EntryType.EXPENSE;
                      User.entries.add(BudgetingEntry(_titleController.text,
                          double.parse(_amountController.text), _type));

                      final result = await Database.conn.execute(
                        r'INSERT INTO budgeting_entry (user_id, title, amount, entry_type) VALUES ($1, $2, $3, $4)',
                        parameters: [
                          User.id,
                          _titleController.text,
                          double.parse(_amountController.text),
                          _typeIndex
                        ],
                      );

                      // If account successfully created, go back to login page
                      if (result.affectedRows == 1) {
                        Navigator.pop(context);
                      } else {
                        PopUp.showAlertDialog(context, 'Error',
                            'Something went wrong. Please try again.');
                      }
                    }
                  },
                  child: const Text("Save Entry")),
            )
          ],
        ));
  }
}
