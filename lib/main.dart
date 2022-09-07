import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/answer.dart';
import 'package:flutter_complete_guide/question.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';

import './question.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      "questionText": "What's your favorite color?",
      'answer': [
        {"text": "Black", "score": 10},
        {"text": "Red", "score": 5},
        {"text": "Green", "score": 3},
        {"text": "White", "score": 1},
      ]
    },
    {
      "questionText": "What's your favorite animal?",
      "answer": [
        {"text": "Dragon", "score": 10},
        {"text": "Cat", "score": 3},
        {"text": "Lion", "score": 2},
      ]
    },
    {
      "questionText": "What's your favorite instructor?",
      "answer": [
        {"text": "Bob", "score": 10},
        {"text": "Max", "score": 3},
        {"text": "David", "score": 2},
      ]
    }
  ];

  int _questionIndex = 0;
  int _totalScore = 0;
  _answerQuestion(int score) {
    setState(() {
      _totalScore = _totalScore + score;
      _questionIndex = _questionIndex + 1;
      if (_questionIndex > _questions.length) _questionIndex = 0;
    });
  }

  _restartQuiz() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Hello"),
            ),
            body: _questionIndex < _questions.length
                ? Quiz(
                    questions: _questions,
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                  )
                : Result(
                    totalScore: _totalScore,
                    restartQuix: _restartQuiz,
                  )));
  }
}
