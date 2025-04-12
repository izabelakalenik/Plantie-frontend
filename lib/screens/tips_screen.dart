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
  int _pageIndex = 0;

  final List<Map<String, dynamic>> tips = [
    {
      'wrongImage': 'assets/icon_tree.png',
      'rightImage': 'assets/icon_tree.png',
      'title': tip1,
      'description': tip1Description,
    },
    {
      'wrongImage': 'assets/blurry.png',
      'rightImage': 'assets/sharp.png',
      'title': tip2,
      'description': tip2Description,
    },
    {
      'wrongImage': 'assets/dark.png',
      'rightImage': 'assets/light.png',
      'title': tip3,
      'description': tip3Description,
    },
  ];

  void _nextPage() {
    if (_pageIndex < tips.length - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  void _prevPage() {
    if (_pageIndex > 0) {
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
        currentIndex: 1,
        pageIndex: _pageIndex,
        pageController: _pageController,
        onPageChanged: (index) {
          setState(() {
            _pageIndex = index;
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
  final int pageIndex;
  final int currentIndex;
  final PageController pageController;
  final void Function(int) onPageChanged;
  final void Function() onNext;
  final void Function() onBack;

  const TipsScreenContent({
    super.key,
    required this.tips,
    required this.currentIndex,
    required this.pageIndex,
    required this.pageController,
    required this.onPageChanged,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Padding(
              padding: customScreenPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),

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
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              tip['description'],
                              style: const TextStyle(
                                  fontSize: 14, color: descTextColor),
                            ),
                          ],
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// DOTS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      tips.length,
                          (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 3),
                        child: _dot(index == pageIndex),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// BUTTONS
                  Row(
                    children: [
                      CustomButton(
                        onPressed: pageIndex > 0 ? onBack : () {},
                        text: "Back",
                        horizontalPadding: 30,
                        verticalPadding: 10,
                      ),
                      const Spacer(),
                      CustomButton(
                        onPressed: pageIndex < tips.length - 1
                            ? onNext
                            : () {},
                        text: pageIndex == tips.length - 1 ? "Finish" : "Next",
                        horizontalPadding: 30,
                        verticalPadding: 10,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _dot(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: isActive ? colorGreen: Colors.grey.shade300,
        shape: BoxShape.circle,
      ),
    );
  }
}

