import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                var indexColor = const Color.fromARGB(255, 235, 108, 239);
                if (data['correct_answer'] == data['selected_answer']) {
                  indexColor = const Color.fromARGB(255, 97, 222, 233);
                }

                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: indexColor,
                      ),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'].toString(),
                            style: GoogleFonts.lato(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            data['selected_answer'].toString(),
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 197, 82, 242),
                            ),
                          ),
                          Text(
                            data['correct_answer'].toString(),
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 97, 222, 233),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }).toList(),
        ),
      ),
    );
  }
}
