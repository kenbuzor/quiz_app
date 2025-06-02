import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.changeScreen, {super.key});

  final void Function() changeScreen;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "assets/images/quiz-logo.png",
            width: 250,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            "Learn Flutter the fun way!",
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 237, 223, 252),
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 40),
          OutlinedButton.icon(
            onPressed: changeScreen,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            icon: const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
              size: 24,
            ),
            label: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
