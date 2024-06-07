import 'package:flutter/material.dart';
import 'package:flutter_questionnaire/welcome_screen.dart';

void main() => runApp(
      MaterialApp(
        theme: ThemeData(useMaterial3: true),
        home: const WelcomeScreen(),
      ),
    );
