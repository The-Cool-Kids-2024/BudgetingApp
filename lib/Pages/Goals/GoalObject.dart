class GoalObject {
  String name;
  double goalAmount;
  DateTime goalEndDate;

  double currentAmount;
  DateTime dateCreated;
  List<Contribution> contributions;

  GoalObject(this.name, this.goalAmount, this.goalEndDate, this.currentAmount, this.dateCreated, {this.contributions = const <Contribution>[]});
  GoalObject.empty() : name = "", goalAmount = 0, goalEndDate = DateTime.now(), currentAmount = 0, dateCreated = DateTime.now(), contributions = const <Contribution>[];
}

class Contribution {
  double amount;
  DateTime date;
  String? note;
  Contribution(this.amount, this.date, {this.note});
}