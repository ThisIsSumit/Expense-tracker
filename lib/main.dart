import 'package:expence_tracker/expenseshower.dart';
import 'package:flutter/material.dart';


var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 144, 0, 255));

var kdarktheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: const Color.fromARGB(255, 9, 125, 100));
void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kdarktheme,
        cardTheme: const CardTheme().copyWith(
          color: kdarktheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kdarktheme.primaryContainer),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        // scaffoldBackgroundColor: Color.fromARGB(142, 205, 7, 255)
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: kColorScheme.primaryContainer),
        ),
        textTheme: const TextTheme().copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 15,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            color: kColorScheme.onSecondaryContainer,
            fontSize: 12,
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      home: const ExpenceShower(),
    ),
  );
}
