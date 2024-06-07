import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({super.key, required this.answerText, required this.onPressed});

  final String answerText;
  final Function(String answerText) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 50),
      child: OutlinedButton(
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
          onPressed(answerText);
        },
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(69, 198, 201, 1),
            ),
          ),
        ),
      ),
    );
  }
}
