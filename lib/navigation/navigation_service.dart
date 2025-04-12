import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import '../screens/home_screen.dart';
import '../screens/tips_screen.dart';

void navigateTo(BuildContext context, int currentIndex, int targetIndex) {
  if (targetIndex == currentIndex) return;

  Widget screen;

  switch (targetIndex) {
    case 0:
      screen = const HomeScreen();
      break;
    case 1:
      screen = const TipsScreen();
      break;
    default:
      return;
  }

  final isForward = targetIndex > currentIndex;

  Navigator.pushReplacement(
    context,
    PageTransition(
      type: isForward
          ? PageTransitionType.rightToLeft
          : PageTransitionType.leftToRight,
      child: screen,
      duration: const Duration(milliseconds: 200),
      reverseDuration: const Duration(milliseconds: 200),
    ),
  );
}
