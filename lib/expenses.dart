import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/expenses_list.dart';
import 'package:flutter_expense_tracker/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registedExpenses = [
    Expense(
        title: "flutter",
        amount: 19.99,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: "food",
        amount: 12.99,
        date: DateTime.now(),
        category: Category.food)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Expense Tracker")),
      body: Column(children: [
        const Text("The Chart"),
        Expanded(child: ExpensesList(expenses: _registedExpenses))
      ]),
    );
  }
}
