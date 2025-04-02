import 'package:flutter/material.dart';
import 'package:plant_app/screens/home_screen.dart';
import 'package:plant_app/styles/theme.dart';

class Plantie extends StatelessWidget {
  const Plantie({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: mainTheme,
      home: const HomeScreen(),
    );
  }
}