import 'package:flutter/material.dart';

import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreen();
  }
}

class _QuestionScreen extends State<QuestionScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);

    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: SizedBox(
        width: double.infinity, //take entire width of page altenative to center
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((item) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: AnswerButton(item, () {
                  answerQuestion(item);
                }),
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
