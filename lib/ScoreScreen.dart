import 'package:flutter/material.dart';
import 'package:flutter_questionnaire/questions.dart';

class ScoreScreen extends StatelessWidget {
  const ScoreScreen.scoreScreen(
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
                style: const TextStyle(
                    color: Color.fromRGBO(91, 170, 238, 1.0), fontSize: 30),
              ),
              Container(
                height: 400,
                margin: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount: selectedAnswers.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(16, 122, 197, 1.0),
                          ),
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                questions[index].question,
                                textAlign: TextAlign.start,
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromRGBO(132, 157, 178, 1.0),
                                ),
                              ),
                              Text(
                                questions[index].answers[0],
                                style: const TextStyle(
                                    color: Color.fromRGBO(
                                      132,
                                      157,
                                      178,
                                      1.0,
                                    ),
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                selectedAnswers[index],
                                style: const TextStyle(
                                  color: Color.fromRGBO(82, 104, 122, 1.0),
                                ),
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
                child: const Text(
                  'Restart Quiz',
                  style: TextStyle(
                    color: Color.fromRGBO(69, 198, 201, 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
