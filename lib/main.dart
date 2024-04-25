import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'ExpensesListWidget.dart';
import 'NewExpenseWidget.dart';
import 'Expense.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masroufi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        // Other theme configurations...
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Expense> allExpenses = [];

  void addNewExpense({required String title, required double amount, required DateTime date}) {
    setState(() {
      allExpenses.add(Expense(amount: amount, date: date, id: DateTime.now().toString(), title: title));
    });
    void addNewExpense({required String title, required double amount, required DateTime date}) async {
      setState(() {
        allExpenses.add(Expense(amount: amount, date: date, id: DateTime.now().toString(), title: title));
      });
      await Future.delayed(Duration(seconds: 1)); // Adjust the delay as needed
      Navigator.of(context).pop(); // Close the modal bottom sheet
    }  }

  void deleteExpense({required String id}) {
    setState(() {
      allExpenses.removeWhere((e) => e.id == id);
    });
  }

  double calculateTotal() {
    double total = 0;
    allExpenses.forEach((e) {
      total += e.amount;
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Masroufi'),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (b) {
                  return ExpenseForm(addnew: addNewExpense);
                },
              );
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.all(10),
            height: 100,
            child: Card(
              elevation: 5,
              child: Center(
                child: Text(
                  'EGP ${calculateTotal().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
          ExpensesListWidget(allExpenses: allExpenses, deleteExpense: deleteExpense),
        ],
      ),
    );
  }
}
