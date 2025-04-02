import 'package:flutter/material.dart';
import 'package:plant_app/styles/layouts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return const MainLayout(
        appBarText: "Plantie",
        child: HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});


  @override
  Widget build(BuildContext context) {

    return Padding (
      padding: customScreenPadding,
      child: Column(

      ),
    );
  }

}
