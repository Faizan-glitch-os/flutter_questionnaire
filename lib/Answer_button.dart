import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answerText, required this.onPressed});

  final String answerText;
  final Function(String answerText) onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 50.w),
      child: OutlinedButton(
        style: ButtonStyle(
          side: WidgetStateProperty.all(
            const BorderSide(
              color: Color.fromRGBO(69, 198, 201, 1),
            ),
          ),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
        onPressed: () {
          onPressed(answerText);
        },
        child: Padding(
          padding: EdgeInsets.all(5.r),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'montserrat',
              color: const Color.fromRGBO(69, 198, 201, 1),
              fontSize: 12.sp,
            ),
          ),
        ),
      ),
    );
  }
}
