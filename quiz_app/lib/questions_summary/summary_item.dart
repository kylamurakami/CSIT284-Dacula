import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:adv_basics/questions_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemData, {super.key});

  final Map<String, Object> itemData;

  @override
  Widget build(BuildContext context) {
    final isCorrectAnswer =
        itemData['user_answer'] == itemData['correct_answer'];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemData['question_index'] as int,
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFF3E6D5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemData['question'] as String,
                    style: GoogleFonts.lato(
                      color: const Color(0xFF800020),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    'Your answer: ${itemData['user_answer']}',
                    style: const TextStyle(
                      color: Color(0xFF800020),
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 3),

                  Text(
                    'Correct answer: ${itemData['correct_answer']}',
                    style: const TextStyle(
                      color: Color(0xFF5C0017),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}