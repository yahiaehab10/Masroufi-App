import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_core/firebase_core.dart';

import 'Expense.dart';

final databaseURL = Uri.parse(
    'https://masroufi-application-e3ed7-default-rtdb.firebaseio.com/<path-to-data>.json');

Future<void> addExpense(
    {required String title,
    required double amount,
    required DateTime date}) async {
  final response = await http.post(
    databaseURL,
    body: json.encode({
      'title': title,
      'amount': amount,
      'date': date.toIso8601String(),
    }),
  );

  if (response.statusCode >= 400) {
    throw Exception('Failed to add expense');
  }
}

Future<void> deleteExpense({required String id}) async {
  final response = await http.delete(
    databaseURL.replace(path: '${databaseURL.path}/$id'),
  );

  if (response.statusCode >= 400) {
    throw Exception('Failed to delete expense');
  }
}

Future<List<Expense>> fetchExpenses() async {
  final response = await http.get(databaseURL);

  if (response.statusCode >= 400) {
    throw Exception('Failed to fetch expenses');
  }

  final data = json.decode(response.body) as Map<String, dynamic>;
  return data.entries.map((entry) {
    final id = entry.key;
    final expenseData = entry.value as Map<String, dynamic>;
    return Expense(
      id: id,
      title: expenseData['title'],
      amount: expenseData['amount'],
      date: DateTime.parse(expenseData['date']),
    );
  }).toList();
}
