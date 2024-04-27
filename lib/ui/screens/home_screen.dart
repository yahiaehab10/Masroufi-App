import 'package:flutter/material.dart';
import 'package:masroufi/models/expense.dart';
import 'package:masroufi/services/expense_service.dart';
import 'package:masroufi/widgets/expense_form.dart';
import 'package:masroufi/widgets/expense_list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ExpenseService _expenseService = ExpenseService();
  List<Expense> _expenses = [];

  @override
  void initState() {
    super.initState();
    _getExpenses();
  }

  Future<void> _getExpenses() async {
    _expenses = await _expenseService.getExpenses().first; // Get initial data
    setState(() {});
  }

  Future<void> _addExpense(Expense expense) async {
    await _expenseService.addExpense(expense);
    _getExpenses(); // Refresh list after add
  }

  Future<void> _updateExpense(Expense expense) async {
    await _expenseService.updateExpense(expense);
    _getExpenses(); // Refresh list after update
  }

  Future<void> _deleteExpense(String expenseId) async {
    print('Deleting expense with ID: $expenseId');
    await _expenseService.deleteExpense(expenseId);
    _getExpenses(); // Refresh list after delete
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masroufi'),
      ),
      body: Container(
        color: const Color.fromARGB(
            255, 208, 193, 237), // Change this to your desired color
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            ExpenseForm(onAdd: _addExpense),
            Expanded(
                child: ExpenseList(
                    expenses: _expenses,
                    onUpdate: _updateExpense,
                    onDelete: _deleteExpense)),
          ],
        ),
      ),
    );
  }
}
