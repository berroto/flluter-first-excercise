import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Answer extends StatelessWidget {
  final void Function() answerQuestion;
  // ignore: prefer_typing_uninitialized_variables
  final answerText;
  const Answer(
      {required this.answerQuestion, required this.answerText, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        // ignore: sort_child_properties_last
        child: Text(
          answerText,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          textStyle: const TextStyle(color: Colors.black),
        ),
        onPressed: answerQuestion,
      ),
    );
  }

  Function get newMethod => answerQuestion;
}
