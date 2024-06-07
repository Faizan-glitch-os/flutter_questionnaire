import 'package:flutter/material.dart';
import 'package:flutter_questionnaire/Answer_button.dart';
import 'package:flutter_questionnaire/ScoreScreen.dart';

import 'questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;

  final List<String> selectedAnswers = [];

  void questionIndexer(answerText) {
    if (questionIndex < questions.length - 1) {
      setState(
        () {
          questionIndex++;
          selectedAnswers.add(answerText);
        },
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Scorescreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];
    print('selectedAnswers.lenght ${selectedAnswers.length}');

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 72, 128, 1.0),
            Color.fromRGBO(0, 24, 42, 1.0),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                currentQuestion.question,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(132, 157, 178, 1.0), fontSize: 30),
              ),
              SizedBox(height: 50),
              ...currentQuestion.getShuffledAnswers().map(
                (item) {
                  return AnswerButton(
                    answerText: item,
                    onPressed: questionIndexer,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
