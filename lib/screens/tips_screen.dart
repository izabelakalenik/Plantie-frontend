import 'package:flutter/material.dart';
import 'package:plant_app/styles/layout.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
      appBarText: "Tips",
      child: TipsScreenContent(),
    );
  }
}

class TipsScreenContent extends StatelessWidget {
  const TipsScreenContent({super.key});


  @override
  Widget build(BuildContext context) {

    return Padding (
      padding: customScreenPadding,
      child: Column(

      ),
    );
  }

}