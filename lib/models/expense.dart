class Expense {
  String id; // Firebase-generated document ID
  String title;
  double amount;
  DateTime date;

  Expense({
    required this.title,
    required this.amount,
    required this.date,
    this.id = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'amount': amount,
      'date': date
          .toIso8601String(), // Convert date to a string format understood by Firestore
    };
  }

  static Expense fromMap(Map<String, dynamic> map) => Expense(
        title: map['title'] as String,
        amount: map['amount'] as double,
        date: DateTime.parse(
            map['date'] as String), // Parse date string back to DateTime
      );
}
