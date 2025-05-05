import 'package:flutter/material.dart';
import '../constants/colors.dart';

final mainTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
  fontFamily: 'BeVietnamPro',
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: buttonGreen,
    unselectedItemColor: Colors.grey,
    showUnselectedLabels: true,
    selectedIconTheme: IconThemeData(size: 32),
    unselectedIconTheme: IconThemeData(size: 28),
    selectedLabelStyle: TextStyle(fontSize: 16),
    unselectedLabelStyle: TextStyle(fontSize: 14),
  ),
  textTheme: const TextTheme(
    headlineLarge: TextStyle(fontWeight: FontWeight.w700),
    headlineMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, color: descTextColor),
  ),
);
