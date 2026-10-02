import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:expense_tracker/widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color(0xFF810B38),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color(0xFF541A1A),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: const Color(0xFF541A1A),
        cardTheme: const CardThemeData().copyWith(
          color: const Color(0xFFDCC3AA),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFDCC3AA),
            foregroundColor: const Color(0xFF541A1A),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData.dark().textTheme,
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: const Color(0xFFF1E2D1),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color(0xFF810B38),
          foregroundColor: const Color(0xFFF1E2D1),
        ),
        cardTheme: const CardThemeData().copyWith(
          color: const Color(0xFFDCC3AA),
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF810B38),
            foregroundColor: const Color(0xFFF1E2D1),
          ),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          ThemeData().textTheme,
        ).copyWith(
          titleLarge: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF541A1A),
            fontSize: 16,
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
}