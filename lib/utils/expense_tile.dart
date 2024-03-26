import 'package:flutter/material.dart';
import 'package:test_flutter/CCTheme.dart';

// TODO : fix removeTransaction


class ExpenseTile extends StatelessWidget {
  final String transactionName;
  final double transactionAmount;
  // Function() removeTransaction;

  ExpenseTile({
    super.key,
    required this.transactionName,
    required this.transactionAmount,
    // required this.removeTransaction,
    });

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
            Text(transactionName),
            Text(transactionAmount.toString()),
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