import 'package:flutter/material.dart';
import 'package:masroufi/models/expense.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final Function(Expense) onUpdate;
  final Function(String) onDelete;

  const ExpenseList(
      {Key? key,
      required this.expenses,
      required this.onUpdate,
      required this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final expense = expenses[index];
        return ListTile(
          title: Text(expense.title),
          subtitle: Text(
              '${expense.amount.toStringAsFixed(2)} - ${expense.date.toIso8601String().split('T')[0]}'), // Display only date
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () => _showUpdateDialog(context, expense),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onDelete(expense.id),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showUpdateDialog(BuildContext context, Expense expense) {
    // Implement a dialog to edit expense details (similar to ExpenseForm)
    // Call onUpdate with the updated expense details after successful edit
  }
}
