import 'package:flutter/material.dart';
import 'package:plant_app/constants/texts.dart';
import 'package:plant_app/styles/layout.dart';
import '../widgets/custom_elements.dart';

class LoadScreen extends StatefulWidget {
  const LoadScreen({super.key});

  @override
  State<LoadScreen> createState() => _LoadScreenState();
}

class _LoadScreenState extends State<LoadScreen> {

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      appBarText: "Plantie",
      currentIndex: 2,
      child: LoadScreenContent(),
    );
  }
}

class LoadScreenContent extends StatelessWidget {
  const LoadScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomTextContainer(text: loadText),
          const SizedBox(height: 50),
          ClipOval(
            child: Image.asset(
              'assets/home_fruits.jpg',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
