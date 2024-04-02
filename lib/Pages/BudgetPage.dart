import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:test_flutter/BudgetingEntry.dart';
import 'package:test_flutter/CCTheme.dart';
import '../CommonWidgets/CCComponents.dart';
import '../User.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({Key? key}) : super(key: key);

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  @override
  Widget build(BuildContext context) {
    Column col = Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: CCTheme.background,
                  shape: BoxShape.rectangle,
                ),
              ),
            ],
          ),
        ),
        CCHeaderContainer("Monthly Budget",
            "Net Balance: \$${(User.getIncome() - User.getExpenses()).toStringAsFixed(2)}"),
        CCSpacer(),
      ],
    );

    for (var entry in User.entries) {
      if (entry.type == EntryType.INCOME) {
        col.children.add(
            CCContainer(entry.title, '\$${entry.amount.toStringAsFixed(2)}'));
        col.children.add(
            CCSpacer());
      }
      else {
        col.children.add(
            CCContainer(entry.title, '-\$${entry.amount.toStringAsFixed(2)}', textColor: Colors.red));
        col.children.add(
            CCSpacer());
      }
    }

    return Scaffold(
      backgroundColor: CCTheme.background,
      body: SingleChildScrollView(child: col),
    );
  }
}
