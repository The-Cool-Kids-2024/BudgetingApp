import 'package:test_flutter/BudgetingEntry.dart';
import 'Database.dart';
import 'BudgetingEntry.dart';

class User {
  static int id = 0;
  static String username = "";
  static String firstName = "";
  static String lastName = "";
  static List<BudgetingEntry> entries = List.empty(growable: true);

  static reset() {
    id = 0;
    username = "";
    firstName = "";
    lastName = "";
  }

  static getEntries() async {
    final results = await Database.conn.execute(
      r'SELECT * FROM budgeting_entry WHERE user_id = $1',
      parameters: [id],
    );

    // Add entry to entry list for each existing result
    for (var result in results) {
      String title = result[2].toString();
      double amount = double.parse(result[3].toString());
      EntryType type;
      if (result[4].toString() == '0')
        type = EntryType.INCOME;
      else
        type = EntryType.EXPENSE;
      BudgetingEntry entry = BudgetingEntry(title, amount, type);

      entries.add(entry);
    }
  }

  static double getIncome() {
    double income = 0;
    for (var entry in entries) {
      if (entry.type == EntryType.INCOME) {
        income += entry.amount;
      }
    }

    return income;
  }

  static double getExpenses() {
    double expenses = 0;
    for (var entry in entries) {
      if (entry.type == EntryType.EXPENSE) {
        expenses += entry.amount;
      }
    }

    return expenses;
  }
}
