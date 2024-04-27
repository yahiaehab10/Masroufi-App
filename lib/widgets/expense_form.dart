import 'package:flutter/material.dart';
import 'package:masroufi/models/expense.dart';

class ExpenseForm extends StatefulWidget {
  final Function(Expense) onAdd; // Callback to add a new expense

  const ExpenseForm({Key? key, required this.onAdd}) : super(key: key);

  @override
  _ExpenseFormState createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  double _amount = 0.0;
  DateTime _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(labelText: 'Title'),
            validator: (value) =>
                value!.isEmpty ? 'Please enter a title' : null,
            onSaved: (value) => _title = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Amount'),
            keyboardType: TextInputType.number,
            validator: (value) =>
                value!.isEmpty ? 'Please enter an amount' : null,
            onSaved: (value) => _amount = double.parse(value!),
          ),
          TextButton.icon(
            onPressed: () => _selectDate(context),
            icon: Icon(Icons.calendar_today),
            label: Text(
                '${_date.toIso8601String().split('T')[0]}'), // Display only date
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                widget.onAdd(
                    Expense(title: _title, amount: _amount, date: _date));
                // Clear form after successful submission (optional)
                _formKey.currentState!.reset();
                _title = '';
                _amount = 0.0;
                _date = DateTime.now();
              }
            },
            child: Text('Add Expense'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2023, 1, 1), // Adjust as needed
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _date = pickedDate;
      });
    }
  }
}
