import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors.dart';
import 'package:plant_app/styles/layout.dart';
import 'package:plant_app/widgets/custom_elements.dart';

import '../constants/texts.dart';


class TipsScreen extends StatefulWidget {
  const TipsScreen({super.key});

  @override
  State<TipsScreen> createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, dynamic>> tips = [
    {
      'wrongImage': 'assets/icon_tree.png',
      'rightImage': 'assets/icon_tree.png',
      'title': 'Place your plant in the center',
      'description': 'Place your plant in the center of the frame to make the identification more accurate.',
    },
    {
      'wrongImage': 'assets/blurry.png',
      'rightImage': 'assets/sharp.png',
      'title': 'Avoid blurry photos',
      'description': 'Try to keep your camera steady for better results.',
    },
    {
      'wrongImage': 'assets/dark.png',
      'rightImage': 'assets/light.png',
      'title': 'Use natural light',
      'description': 'Lighting helps improve identification accuracy.',
    },
  ];

  void _nextPage() {
    if (_currentIndex < tips.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _prevPage() {
    if (_currentIndex > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      appBarText: "Tips",
      currentIndex: 1,
      child: TipsScreenContent(
        tips: tips,
        currentIndex: _currentIndex,
        pageController: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        onNext: _nextPage,
        onBack: _prevPage,
      ),
    );
  }
}

class TipsScreenContent extends StatelessWidget {
  final List<Map<String, dynamic>> tips;
  final int currentIndex;
  final PageController pageController;
  final void Function() onNext;
  final void Function() onBack;
  final void Function(int) onPageChanged;

  const TipsScreenContent({
    super.key,
    required this.tips,
    required this.currentIndex,
    required this.pageController,
    required this.onNext,
    required this.onBack,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customScreenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),

          /// === SLIDES: PageView ===
          SizedBox(
            height: 360,
            child: PageView.builder(
              controller: pageController,
              itemCount: tips.length,
              onPageChanged: onPageChanged,
              itemBuilder: (context, index) {
                final tip = tips[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomImageContainer(
                      imagePath: tip['wrongImage'],
                      backgroundColor: containerWrong,
                      iconColor: colorRed,
                      iconSign: Icons.close,
                    ),
                    const SizedBox(height: 20),
                    CustomImageContainer(
                      imagePath: tip['rightImage'],
                      backgroundColor: containerRight,
                      iconColor: colorGreen,
                      iconSign: Icons.check,
                    ),
                    const SizedBox(height: 30),
                    Text(
                      tip['title'],
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      tip['description'],
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ],
                );
              },
            ),
          ),

          const Spacer(),

          /// DOTS
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              tips.length,
                  (index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: _dot(index == currentIndex),
              ),
            ),
          ),
          const SizedBox(height: 20),

          /// BUTTONS
          Row(
            children: [
              CustomButton(
                onPressed: currentIndex > 0 ? onBack : () {},
                text: "Back",
              ),
              const Spacer(),
              CustomButton(
                onPressed: currentIndex < tips.length - 1 ? onNext : () {
                  // Tutorial finished
                  Navigator.pop(context);
                },
                text: currentIndex == tips.length - 1 ? "Finish" : "Next",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dot(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.green : Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}

