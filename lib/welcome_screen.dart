import 'package:flutter/material.dart';
import 'package:flutter_questionnaire/questions_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromRGBO(0, 72, 128, 1.0),
          Color.fromRGBO(0, 24, 42, 1.0)
        ], begin: Alignment.topRight, end: Alignment.bottomLeft),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/flutter.826x1024.png',
              fit: BoxFit.cover,
              width: 300,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Flutter Questionnaire',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuestionsScreen();
                }));
              },
              child: Text('Start Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
