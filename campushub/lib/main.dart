import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'package:campus_hub/providers/favorites_provider.dart';
import 'package:campus_hub/screens/tabs.dart';

const Color canvas = Color(0xFFF4F7FA);
const Color accentLight = Color(0xFFB8D8D8);
const Color accent = Color.fromARGB(255, 236, 236, 187);
const Color primary = Color.fromARGB(255, 141, 25, 41);
const Color secondary = Color.fromARGB(255, 223, 216, 186);
const Color border = Color(0xFFDCE8F0);
const Color textColor = Color.fromARGB(255, 85, 5, 5);

final theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: canvas,
  colorScheme: ColorScheme.fromSeed(
    seedColor: primary,
    brightness: Brightness.light,
    primary: primary,
    secondary: accent,
    surface: canvas,
    onSurface: textColor,
  ),
  textTheme: GoogleFonts.latoTextTheme(
    ThemeData.light().textTheme,
  ).apply(
    bodyColor: textColor,
    displayColor: textColor,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: canvas,
    foregroundColor: primary,
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 6,
    shadowColor: primary.withValues(alpha: 0.12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22),
      side: const BorderSide(
        color: border,
        width: 1.3,
      ),
    ),
    margin: const EdgeInsets.all(10),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.white,
    indicatorColor: accentLight,
    elevation: 8,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(
        color: primary,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: primary,
    unselectedItemColor: secondary,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 10,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: canvas,
    surfaceTintColor: Colors.transparent,
    width: 300,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return primary;
      }
      return Colors.white;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return accentLight;
      }
      return border;
    }),
  ),
);

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => FavoritesProvider(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusHub',
      theme: theme,
      home: const TabsScreen(),
    );
  }
}