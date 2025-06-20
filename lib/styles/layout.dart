import 'package:flutter/material.dart';
import '../widgets/custom_elements.dart';

EdgeInsets customScreenPadding =
    const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0);

class MainLayout extends StatelessWidget {
  final Widget child;
  final String appBarText;
  final int currentIndex;

  const MainLayout({
    required this.child,
    required this.appBarText,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text: appBarText),
        body: child,
        bottomNavigationBar: currentIndex >= 0
            ? CustomBottomNavBar(currentIndex: currentIndex)
            : null,
      ),
    );
  }
}


