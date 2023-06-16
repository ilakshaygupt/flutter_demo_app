import 'package:expense_manager/expenses_list.dart';
import 'package:expense_manager/widget/new_expense.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const NewExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EXPENSE TRACKER"), actions: [
        IconButton(
            onPressed: _openAddExpenseOverlay, icon: const Icon(Icons.add))
      ]),
      body: Column(
        children: [
          const Text("THE CHART"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
