import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
    required this.onRestart,
  });

  final void Function() onRestart;
  final List<String> chosenAnswers;

  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;

    final numCorrectQuestions = summaryData
        .where(
          (data) => data['user_answer'] == data['correct_answer'],
        )
        .length;

    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_events_outlined,
              size: 55,
              color: Color(0xFF800020),
            ),

            const SizedBox(height: 15),

            Text(
              'Quiz Complete!',
              style: GoogleFonts.lato(
                color: const Color(0xFF800020),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'You answered $numCorrectQuestions out of '
              '$numTotalQuestions questions correctly!',
              style: GoogleFonts.lato(
                color: const Color(0xFF800020),
                fontSize: 17,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            QuestionsSummary(summaryData),

            const SizedBox(height: 20),

            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF800020),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
              ),
              icon: const Icon(Icons.refresh),
              label: const Text(
                'Restart Quiz',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}