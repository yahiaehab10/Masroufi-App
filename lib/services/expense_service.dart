import 'package:firebase_database/firebase_database.dart';
import 'package:masroufi/models/expense.dart';

class ExpenseService {
  final _dbRef = FirebaseDatabase.instance.reference();

  Future<void> addExpense(Expense expense) async {
    await _dbRef.child('expenses').push().set(expense.toMap());
  }

  Future<void> deleteExpense(String id) async {
    await _dbRef.child('expenses').child(id).remove();
  }

  Stream<List<Expense>> getExpenses() {
    return _dbRef.child('expenses').onValue.map((event) {
      var snapshot = event.snapshot;
      var expenses = <Expense>[];
      (snapshot.value as Map<dynamic, dynamic>).forEach((key, value) {
        var expense = Expense.fromMap(Map<String, dynamic>.from(value));
        expense.id = key;
        expenses.add(expense);
      });
      return expenses;
    });
  }
}
