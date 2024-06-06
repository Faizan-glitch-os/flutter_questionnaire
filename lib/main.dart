import 'package:flutter/material.dart';
import 'package:flutter_questionnaire/questions_screen.dart';
import 'package:flutter_questionnaire/welcome_screen.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: Scaffold(
          body: QuestionsScreen(),
        ),
      ),
    );
