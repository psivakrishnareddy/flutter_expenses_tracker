import 'package:flutter/material.dart';
import 'package:flutter_expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:flutter_expense_tracker/models/expense.dart';
import 'package:flutter_expense_tracker/widgets/new_expense.dart';

import 'chart/chart.dart';

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

  // final List<Expense> _registedExpenses = [];
  void _addExpense(Expense expense) {
    setState(() {
      _registedExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registedExpenses.indexOf(expense);
    setState(() {
      _registedExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registedExpenses.insert(expenseIndex, expense);
            });
          },
        ),
        content: const Text('Expense deleted!')));
  }

  void _openAddExpenseModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => NewExpense(onAddExpense: _addExpense));
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("No expenses found!"),
    );
    if (_registedExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registedExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Expense Tracker"),
        actions: [
          IconButton(
              onPressed: _openAddExpenseModal, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(children: [
        Chart(expenses: _registedExpenses),
        Expanded(child: mainContent)
      ]),
    );
  }
}
