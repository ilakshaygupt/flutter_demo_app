import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expense_manager/models/expense.dart';
import 'package:expense_manager/expenses_list.dart';
import 'package:expense_manager/widget/chart/chart.dart';
import 'package:expense_manager/widget/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  List<Expense> _registeredExpenses = [];

  late ThemeController themeController;

  @override
  void initState() {
    super.initState();
    themeController = Get.put(ThemeController());
    _loadExpenses();
  }

  void _loadExpenses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? expenseStrings = prefs.getStringList('expenses');
    if (expenseStrings != null) {
      setState(() {
        _registeredExpenses = expenseStrings
            .map(
                (e) => Expense.fromJson(json.decode(e) as Map<String, dynamic>))
            .toList();
      });
    }
  }

  void _saveExpenses() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final expenseStrings = _registeredExpenses
        .map((expense) => json.encode(expense.toJson()))
        .toList();
    await prefs.setStringList('expenses', expenseStrings);
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      _saveExpenses(); // Save expenses to shared preferences
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
      _saveExpenses(); // Save expenses to shared preferences
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text(
          'Expense Deleted',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF303F9F),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.white,
          onPressed: () {
            setState(
              () {
                _registeredExpenses.insert(expenseIndex, expense);
                _saveExpenses(); // Save expenses to shared preferences
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(child: Text('NO EXPENSES FOUND'));
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("EXPENSE TRACKER"),
        actions: [
          IconButton(
            onPressed: () {
              themeController.toggleTheme();
            },
            icon: Obx(() => Icon(
                  themeController.isDarkMode.value
                      ? Icons.light_mode
                      : Icons.dark_mode,
                )),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                Expanded(child: mainContent),
              ],
            )
          : Row(
              children: [
                Expanded(
                  child: Chart(expenses: _registeredExpenses),
                ),
                Expanded(child: mainContent),
              ],
            ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 15, 15),
        child: FloatingActionButton(
          onPressed: _openAddExpenseOverlay,
          backgroundColor: Theme.of(context).primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class ThemeController extends GetxController {
  RxBool isDarkMode = true.obs;

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
