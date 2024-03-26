import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/CCTheme.dart';
import '../utils/expense_tile.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {

  // list of expenses
  List expenseList = [
    ["Transaction A", 243.12],
    ["Transaction B",5344.12]
  ];

  //remove transaction
  dynamic removeTransaction(int index) {
    print("Removing " + index.toString());
    // setState(() {
    //   print("Removing " + index.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CCTheme.background,
      body: ListView.builder(
        itemCount: expenseList.length,
        itemBuilder: (context, index) {
          return ExpenseTile(
            transactionName: expenseList[index][0],
            transactionAmount: expenseList[index][1],
            // removeTransaction: removeTransaction(index),

            );
        },
      ),
    );
    // return const Center( child: Text("Budget Page"));
  }
}
