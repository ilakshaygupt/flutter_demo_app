import 'package:flutter/material.dart';
import 'package:quiz_app/create_text.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  @override
  Widget build(context) {
    return const CreateText("Question Screen", 28, Colors.white);
  }
}
