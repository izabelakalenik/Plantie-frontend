import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../navigation/navigation_service.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  final double? height;

  const CustomAppBar({super.key, required this.text, this.height = 80.0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: height,
      title: Row(
        children: [
          Image.asset(
            'assets/icon_succulent.png',
            height: 50,
            width: 50,
          ),
          const SizedBox(width: 20),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height!);
}

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: theme.selectedItemColor,
      unselectedItemColor: theme.unselectedItemColor,
      showUnselectedLabels: theme.showUnselectedLabels,
      selectedIconTheme: theme.selectedIconTheme,
      unselectedIconTheme: theme.unselectedIconTheme,
      selectedLabelStyle: theme.selectedLabelStyle,
      unselectedLabelStyle: theme.unselectedLabelStyle,
      onTap: (index) => navigateTo(context, currentIndex, index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.help_outline),
          label: "Tips",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Saved",
        ),
      ],
    );
  }
}


class CustomTextContainer extends StatelessWidget {
  final String text;

  const CustomTextContainer({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: boxGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: theme.bodyLarge,
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          if (icon != null && text != null) const SizedBox(width: 8),
          if (text != null) Text(text!, style: theme.bodyLarge),
        ],
      ),
    );
  }
}