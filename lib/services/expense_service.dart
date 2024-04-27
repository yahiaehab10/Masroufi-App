import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masroufi/models/expense.dart';

class ExpenseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'expenses'; // Replace with your collection name

  Future<Expense> addExpense(Expense expense) async {
    final docRef =
        await _firestore.collection(_collection).add(expense.toMap());
    expense.id = docRef.id; // Set ID from DocumentReference
    return expense;
  }

  Future<void> updateExpense(Expense expense) async {
    await _firestore
        .collection(_collection)
        .doc(expense.id)
        .update(expense.toMap());
  }

  Future<void> deleteExpense(String expenseId) async {
    await _firestore.collection(_collection).doc(expenseId).delete();
  }

  Stream<List<Expense>> getExpenses() {
    return _firestore.collection(_collection).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Expense.fromMap(doc.data()!)).toList();
    });
  }
}
