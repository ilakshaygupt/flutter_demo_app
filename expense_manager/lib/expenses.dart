import 'package:expense_manager/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:expense_manager/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'flutter course',
        amount: 500,
        date: DateTime.now(),
        category: Category.entertainment),
    Expense(
        title: 'flutter work',
        amount: 5000,
        date: DateTime.now(),
        category: Category.other),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("THE CHART"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
