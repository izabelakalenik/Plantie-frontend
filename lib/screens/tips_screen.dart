import 'package:flutter/material.dart';
import 'package:plant_app/constants/colors.dart';
import 'package:plant_app/styles/layout.dart';
import 'package:plant_app/widgets/custom_elements.dart';

import '../constants/texts.dart';
import '../navigation/navigation_bottom_nav_bar.dart';


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
      'rightImage': 'assets/tips/tip1_correct.png',
      'wrongImage': 'assets/tips/tip1_wrong.png',
      'title': tip1,
      'description': tip1Description,
    },
    {
      'rightImage': 'assets/tips/tip2_correct.png',
      'wrongImage': 'assets/tips/tip2_wrong.png',
      'title': tip2,
      'description': tip2Description,
    },
    {
      'rightImage': 'assets/tips/tip3_correct.png',
      'wrongImage': 'assets/tips/tip3_wrong.png',
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
  final PageController pageController;
  final void Function(int) onPageChanged;
  final void Function() onNext;
  final void Function() onBack;

  const TipsScreenContent({
    super.key,
    required this.tips,
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
                  buildPageView(context),
                  const SizedBox(height: 20),
                  buildDots(),
                  const SizedBox(height: 20),
                  buildButtons(context),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildPageView(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.57,
      child: PageView.builder(
        controller: pageController,
        itemCount: tips.length,
        onPageChanged: onPageChanged,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return SingleChildScrollView(
            child: Column(
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
                  style: theme.headlineMedium,
                ),
                const SizedBox(height: 10),
                Text(
                  tip['description'],
                  style: theme.bodyMedium,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        tips.length,
            (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3),
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: index == pageIndex ? colorGreen : Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildButtons(BuildContext context) {
    return Row(
      children: [
        CustomButton(
          onPressed: pageIndex > 0 ? onBack : () {navigateTo(context, 1, 0);},
          text: "Back",
          horizontalPadding: 30,
          verticalPadding: 10,
        ),
        const Spacer(),
        CustomButton(
          onPressed: pageIndex < tips.length - 1 ? onNext : () {navigateTo(context, 1, 0);},
          text: pageIndex == tips.length - 1 ? "Finish" : "Next",
          horizontalPadding: 30,
          verticalPadding: 10,
        ),
      ],
    );
  }


}

