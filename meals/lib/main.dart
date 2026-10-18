import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:meals/screens/tabs.dart';

const Color cream = Color(0xFFFCF5EE);
const Color lightPink = Color(0xFFFFC4C4);
const Color pink = Color(0xFFEE6983);
const Color darkPink = Color(0xFF850E35);
const Color rose = Color(0xFFC75B7A);
const Color paleRose = Color(0xFFF4D9D0);
const Color darkText = Color(0xFF3A0519);

final theme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  scaffoldBackgroundColor: cream,
  colorScheme: ColorScheme.fromSeed(
    seedColor: darkPink,
    brightness: Brightness.light,
    primary: darkPink,
    secondary: pink,
    surface: cream,
    onSurface: darkText,
  ),
  textTheme: GoogleFonts.latoTextTheme(
    ThemeData.light().textTheme,
  ).apply(
    bodyColor: darkText,
    displayColor: darkText,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: cream,
    foregroundColor: darkPink,
    elevation: 0,
    centerTitle: true,
  ),
  cardTheme: CardThemeData(
    color: Colors.white,
    elevation: 6,
    shadowColor: darkPink.withValues(alpha: 0.12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(22),
      side: const BorderSide(
        color: paleRose,
        width: 1.3,
      ),
    ),
    margin: const EdgeInsets.all(10),
  ),
  navigationBarTheme: NavigationBarThemeData(
    backgroundColor: Colors.white,
    indicatorColor: lightPink,
    elevation: 8,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(
        color: darkPink,
        fontWeight: FontWeight.w700,
      ),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
    selectedItemColor: darkPink,
    unselectedItemColor: rose,
    selectedLabelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    type: BottomNavigationBarType.fixed,
    elevation: 10,
  ),
  drawerTheme: const DrawerThemeData(
    backgroundColor: cream,
    surfaceTintColor: Colors.transparent,
    width: 300,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return darkPink;
      }
      return Colors.white;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return lightPink;
      }
      return const Color(0xFFE7D6D6);
    }),
  ),
);

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blush & Berry Recipes',
      theme: theme,
      home: const TabsScreen(),
    );
  }
}