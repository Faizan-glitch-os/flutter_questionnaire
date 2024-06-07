import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_questionnaire/questions_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
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
            children: [
              Image.asset(
                'assets/images/flutter.826x1024.png',
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width - 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Flutter Questionnaire',
                style: TextStyle(
                    color: Color.fromRGBO(69, 198, 201, 1), fontSize: 30),
              ),
              OutlinedButton(
                style: ButtonStyle(
                  side: WidgetStateProperty.all(
                    BorderSide(
                      color: Color.fromRGBO(69, 198, 201, 1),
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuestionsScreen(),
                    ),
                  );
                },
                child: Text(
                  'Start Quiz',
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
