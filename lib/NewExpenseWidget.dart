import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseForm extends StatefulWidget {
  final Function addnew; // Corrected parameter name (addnew -> addNewExpense)
  ExpenseForm({required this.addnew});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  var title = TextEditingController();
  var amount = TextEditingController();
  DateTime seDate = DateTime.utc(1970, 1, 1);

  void opencalender() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.utc(2024, 12, 30),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        seDate = pickedDate;
      });
    });
  }

  void saveExpense() {
    final titleValue = title.text;
    final amountValue = double.parse(amount.text);

    // Validate input (e.g., check if titleValue is not empty, etc.)

    widget.addnew(
      title: titleValue,
      amount: amountValue,
      date: seDate,
    );

    // Close the modal bottom sheet or perform other actions as needed
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: title,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amount,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(seDate == DateTime.utc(1970, 1, 1)
                      ? 'No Chosen Date'
                      : DateFormat.yMd().format(seDate)),
                ),
                TextButton(
                  onPressed: opencalender,
                  child: Text('Choose Date'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: saveExpense,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
