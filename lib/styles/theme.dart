import 'package:flutter/material.dart';

final mainTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  fontFamily: 'BeVietnamPro',
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Colors.green,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    selectedIconTheme: IconThemeData(size: 32),
    unselectedIconTheme: IconThemeData(size: 28),
    selectedLabelStyle: TextStyle(fontSize: 16),
    unselectedLabelStyle: TextStyle(fontSize: 14),
  ),

  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w700),
  ),
);
