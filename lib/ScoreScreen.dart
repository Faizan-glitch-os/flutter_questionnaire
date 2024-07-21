import 'package:flutter/material.dart';
import 'package:flutter_questionnaire/questions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen(
      {super.key, required this.selectedAnswers, required this.restartQuiz});

  final Function() restartQuiz;
  final List<String> selectedAnswers;

  @override
  Widget build(BuildContext context) {
    final List<String> correctAnswersList = [
      for (var answer in selectedAnswers)
        if (answers.contains(answer)) answer
    ];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(0, 72, 128, 1.0),
            Color.fromRGBO(0, 24, 42, 1.0),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You answered ${correctAnswersList.length} out of ${questions.length} questions correctly',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: const Color.fromRGBO(91, 170, 238, 1.0),
                    fontSize: 25.sp),
              ),
              Container(
                height: 400.h,
                margin: EdgeInsets.all(20.r),
                child: ListView.builder(
                  itemCount: selectedAnswers.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.all(10.r),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10.r),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(16, 122, 197, 1.0),
                          ),
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10.sp),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                questions[index].question,
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontFamily: 'montserrat',
                                  color:
                                      const Color.fromRGBO(132, 157, 178, 1.0),
                                ),
                              ),
                              Text(
                                questions[index].answers[0],
                                style: TextStyle(
                                    color: const Color.fromRGBO(
                                      132,
                                      157,
                                      178,
                                      1.0,
                                    ),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.sp),
                              ),
                              Text(
                                selectedAnswers[index],
                                style: TextStyle(
                                    color:
                                        const Color.fromRGBO(82, 104, 122, 1.0),
                                    fontSize: 10.sp),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                style: ButtonStyle(
                  side: WidgetStateProperty.all(
                    const BorderSide(
                      color: Color.fromRGBO(69, 198, 201, 1),
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: restartQuiz,
                child: Text(
                  'Restart Quiz',
                  style: TextStyle(
                      fontFamily: 'montserrat',
                      color: const Color.fromRGBO(69, 198, 201, 1),
                      fontSize: 10.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
