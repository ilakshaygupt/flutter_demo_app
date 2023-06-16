import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Category { food, transport, bills, entertainment, other }

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.transport: Icons.directions_car,
  Category.bills: Icons.receipt,
  Category.entertainment: Icons.movie,
  Category.other: Icons.money,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  get formattedDate {
    return formatter.format(date);
  }
}
