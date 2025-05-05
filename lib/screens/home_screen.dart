import 'package:flutter/material.dart';
import 'package:plant_app/constants/texts.dart';
import 'package:plant_app/styles/layout.dart';
import '../camera/camera.dart';
import '../widgets/custom_elements.dart';

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
      currentIndex: 0,
      child: HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customScreenPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const CustomTextContainer(text: homeText),
          const SizedBox(height: 50),
          ClipOval(
            child: Image.asset(
              'assets/home_fruits.jpg',
              width: 250,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 50),
          CustomButton(icon: Icons.photo_camera, horizontalPadding: 50, verticalPadding: 20,
              onPressed: () => showImageSourceSelector(context)),
        ],
      ),
    );
  }
}
