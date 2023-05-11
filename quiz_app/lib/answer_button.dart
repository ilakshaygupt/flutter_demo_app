import 'package:flutter/material.dart';
import 'package:quiz_app/create_text.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        backgroundColor: const Color.fromARGB(255, 20, 14, 194),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      // child: Text(answerText),
      child: CreateText(
        answerText,
        15,
        Colors.white,
        align: TextAlign.center,
      ),
    );
  }
}
