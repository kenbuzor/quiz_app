import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'selected_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  int getTotalNoOfCorrectAnswers() {
    var totalAnswered = 0;
    for (var i = 0; i < chosenAnswers.length; i++) {
      if (questions[i].answers[0] == chosenAnswers[i]) {
        totalAnswered++;
      }
    }
    return totalAnswered;
  }

  @override
  Widget build(BuildContext context) {
    final noTotalQuestions = questions.length;
    final noCorrectAnswers =
        summaryData
            .where((data) => data['correct_answer'] == data['selected_answer'])
            .length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You answered $noCorrectAnswers out of $noTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 220, 148, 246),
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              label: const Text('Restart Quiz!'),
              icon: const Icon(Icons.refresh, color: Colors.white),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
