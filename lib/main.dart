import 'package:flutter/material.dart';

import 'package:flutter_expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.green,
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.green,
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: kDarkColorScheme.background,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: kColorScheme.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      themeMode: ThemeMode.system, // default
      home: const Expenses(),
    ),
  );
}
