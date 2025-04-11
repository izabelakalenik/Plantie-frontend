import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/saved_screen.dart';
import '../screens/tips_screen.dart';

void navigateTo(BuildContext context, int currentIndex, int targetIndex) {
  if (targetIndex == currentIndex) return;

  Widget screen;

  switch (targetIndex) {
    case 0:
      screen = const TipsScreen();
      break;
    case 1:
      screen = const HomeScreen();
      break;
    case 2:
      screen = const SavedScreen();
      break;
    default:
      return;
  }

  final isForward = targetIndex > currentIndex;

  Navigator.pushReplacement(
    context,
    PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => screen,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const beginOffsetRight = Offset(1.0, 0.0);
        const beginOffsetLeft = Offset(-1.0, 0.0);
        const endOffset = Offset.zero;
        const curve = Curves.ease;

        final tween = Tween<Offset>(
          begin: isForward ? beginOffsetRight : beginOffsetLeft,
          end: endOffset,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    ),
  );
}
