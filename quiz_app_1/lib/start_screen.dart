import 'package:flutter/material.dart';
import 'package:quiz_app/create_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  void onPressed() {}

  @override
  Widget build(context) {
    return Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 180),
          Image.asset('assets/images/quiz-logo.png',
              width: 250, color: const Color.fromARGB(150, 255, 255, 255)),
          const SizedBox(height: 90),
          const CreateText(
            "Learn Flutter the fun way!",
            20,
            Colors.white,
            isBold: true,
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          )
        ],
      ),
    );
  }
}
