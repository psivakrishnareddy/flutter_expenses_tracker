import 'package:flutter/material.dart';

import 'package:flutter_expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
