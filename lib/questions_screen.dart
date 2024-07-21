import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_questionnaire/Answer_button.dart';
import 'package:flutter_questionnaire/ScoreScreen.dart';
import 'package:flutter_questionnaire/welcome_screen.dart';
import 'questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var questionIndex = 0;
  final List<String> selectedAnswers = [];

  void restartQuiz() {
    questionIndex = 0;
    selectedAnswers.clear();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomeScreen(),
      ),
    );
  }

  void questionIndexer(answerText) {
    selectedAnswers.add(answerText);
    if (questionIndex < questions.length - 1) {
      setState(
        () {
          questionIndex++;
        },
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScoreScreen(
              selectedAnswers: selectedAnswers, restartQuiz: restartQuiz),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
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
                'Question ${questionIndex + 1} of ${questions.length}',
                style: TextStyle(fontSize: 15.sp, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 80.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  currentQuestion.question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      fontWeight: FontWeight.bold,
                      color: const Color.fromRGBO(132, 157, 178, 1.0),
                      fontSize: 30.sp),
                ),
              ),
              SizedBox(height: 50.h),
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
