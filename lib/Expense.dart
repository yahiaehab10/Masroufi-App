class Expense {
  String id;
  String title;
  double amount;
  DateTime date;
  Expense(
      {required this.amount,
      required this.date,
      required this.id,
      required this.title});
}
