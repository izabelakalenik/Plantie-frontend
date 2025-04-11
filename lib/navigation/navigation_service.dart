import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../screens/saved_screen.dart';
import '../screens/tips_screen.dart';

class NavigatorService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void goToScreen(int index) {
    switch (index) {
      case 0:
        navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (_) => const SavedScreen()),
        );
        break;
      case 1:
        navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
        break;
      case 2:
        navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (_) => const TipsScreen()),
        );
        break;
      default:
        navigatorKey.currentState?.pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
    }
  }
}
