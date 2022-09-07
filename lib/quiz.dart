import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;
  const Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questionText: questions[questionIndex]["questionText"] as String,
        ),
        ...(questions[questionIndex]["answer"] as List<Map<String, Object>>)
            .map(
              (answer) => Answer(
                answerQuestion: () => answerQuestion(answer["score"] as int),
                answerText: answer["text"],
              ),
            )
            .toList(),
      ],
    );
  }
}
