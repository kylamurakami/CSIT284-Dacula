
import 'package:flutter/material.dart';

import 'package:meals2/screens/tabs.dart';

final kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 131, 57, 0),
);

final kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 131, 57, 0),
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        scaffoldBackgroundColor: kColorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSurface,
              ),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: kDarkColorScheme.surface,
        appBarTheme: AppBarTheme(
          backgroundColor: kDarkColorScheme.surface,
          foregroundColor: kDarkColorScheme.onSurface,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: kDarkColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: kDarkColorScheme.onSurface,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const TabsScreen(),
    ),
  );
}
