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
    return SizedBox(
      width: double.infinity, //take entire width of page alt to center
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CreateText('QUESTION !', 28, Colors.white),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text('answer 1'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('answer 2'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('answer 3'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('answer 4'),
          ),
        ],
      ),
    );
  }
}
