import 'package:flutter/material.dart';
import 'package:test_flutter/CCTheme.dart';
import './expenseItem.dart';

// TODO : fix removeTransaction


class ExpenseTile extends StatelessWidget {
  // final String transactionName;
  // final double transactionAmount;
  // Function() removeTransaction;

  // ignore: constant_identifier_names
  static const double FONT_SIZE = 20.5;

  // ExpenseTile({
  //   super.key,
  //   required this.transactionName,
  //   required this.transactionAmount,
  //   required this.removeTransaction,
  //   });

  void filler() {
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, left: 20),

      child: Container(
        padding: const EdgeInsets.all(25.0),decoration: const BoxDecoration(
          color: CCTheme.primary
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(transactionName,
                style: TextStyle(fontSize: FONT_SIZE),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(transactionAmount.toString(),
                style: TextStyle(fontSize: FONT_SIZE)),
            ),
            const Icon(Icons.clear_sharp),
            // IconButton(
              // icon: const Icon(Icons.clear_sharp),
              // color: CCTheme.text,
              // onPressed: print("I was pressed!"),
              // onPressed: removeTransaction,
            // ),
          ],
        )
        
      ),
      
    );
  }
}