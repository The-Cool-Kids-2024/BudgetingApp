class BudgetingEntry {
  String title;
  double amount;
  EntryType type;

  BudgetingEntry(this.title, this.amount, this.type);
}

enum EntryType{
  INCOME,
  EXPENSE
}
