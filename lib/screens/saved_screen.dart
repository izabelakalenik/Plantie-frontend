import 'package:flutter/material.dart';
import 'package:plant_app/styles/layout.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  final int _currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarText: "Saved",
      currentIndex: _currentIndex,
      child: const SavedScreenContent(),
    );
  }
}

class SavedScreenContent extends StatelessWidget {
  const SavedScreenContent({super.key});


  @override
  Widget build(BuildContext context) {

    return Padding (
      padding: customScreenPadding,
      child: Column(

      ),
    );
  }

}