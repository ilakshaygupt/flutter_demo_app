import 'package:flutter/material.dart';
import 'package:quiz_app/create_text.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                children: [
                  Container(
                    width: 35,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 88, 163, 197)),
                    child: CreateText(
                        ((data['question_index'] as int) + 1).toString(),
                        20,
                        Colors.white,
                        align: TextAlign.center),
                  ),
                  const SizedBox(
                    width: 10,
                    // height: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CreateText(
                          data['question'] as String,
                          19,
                          Colors.white,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        CreateText(data['correct_answer'] as String, 13,
                            const Color.fromARGB(121, 67, 145, 77),
                            align: TextAlign.left),
                        CreateText(data['user_answer'] as String, 13,
                            Colors.lightBlueAccent,
                            align: TextAlign.left),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
