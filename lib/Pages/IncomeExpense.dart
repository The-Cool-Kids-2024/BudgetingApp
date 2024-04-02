import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_flutter/CCTheme.dart';
// import '../utils/expense_tile.dart';
import '../utils/expenseItem.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {

  // keep track of balance
  int totalBalance = 0;

  // list of expenses
  List<ExpenseItem> expenseItems = [
      ExpenseItem(
        transactionName: 'Groceries',
        transactionType: 'Expense',
        transactionAmount: 50.0,
      ),
      ExpenseItem(
        transactionName: 'Salary',
        transactionType: 'Income',
        transactionAmount: 2000.0,
      ),
      ExpenseItem(
        transactionName: 'Shopping',
        transactionType: 'Expense',
        transactionAmount: 100.0,
      ),
    ];

  void updateTotal(int amount) {
    setState(() {
      totalBalance += amount;
    });
  }


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
        itemCount: expenseItems.length,
        itemBuilder: (context, index) {
          ExpenseItem item = expenseItems[index];
          return ListTile(
            title: Text(item.transactionName),
            subtitle: Text('${item.transactionType}: \$${item.transactionAmount.toStringAsFixed(2)}'),
          );
        },
      )
    );
    // return const Center( child: Text("Budget Page"));
  }
}
