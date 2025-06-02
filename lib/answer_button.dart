import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({super.key, required this.answer, required this.onTap});

  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 44, 2, 57),
      ),
      onPressed: onTap,
      child: Text(answer, textAlign: TextAlign.center),
    );
  }
}
