import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../navigation/navigation_bottom_nav_bar.dart';

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
            'assets/icon_tree.png',
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
      currentIndex: currentIndex >= 0 ? currentIndex : 0,
      selectedItemColor: theme.selectedItemColor,
      unselectedItemColor: theme.unselectedItemColor,
      showUnselectedLabels: theme.showUnselectedLabels,
      selectedIconTheme: theme.selectedIconTheme,
      unselectedIconTheme: theme.unselectedIconTheme,
      selectedLabelStyle: theme.selectedLabelStyle,
      unselectedLabelStyle: theme.unselectedLabelStyle,
      onTap: (index) {
        if (currentIndex >= 0) {
          navigateTo(context, currentIndex, index);
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help_outline),
          label: "Tips",
        ),
      ],
    );
  }
}


class CustomTextContainer extends StatelessWidget {
  final String? headline;
  final String text;

  const CustomTextContainer({
    super.key,
    this.headline,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      alignment: headline != null ? Alignment.centerLeft : Alignment.center,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: boxGreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment:
        headline != null ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          if (headline != null)
            Text(
              headline!,
              style: theme.titleMedium,
            ),
          if (headline != null) const SizedBox(height: 8),
          Text(
            text,
            textAlign: headline != null ? TextAlign.left : TextAlign.center,
            style: theme.bodyLarge,
          ),
        ],
      ),
    );
  }
}


class CustomImageContainer extends StatelessWidget {
  final String imagePath;
  final Color backgroundColor;
  final Color iconColor;
  final IconData iconSign;


  const CustomImageContainer({
    super.key,
    required this.imagePath,
    required this.backgroundColor,
    required this.iconColor,
    required this.iconSign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              imagePath,
              height: 100,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: iconColor,
              child: Icon(iconSign, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double horizontalPadding;
  final double verticalPadding;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    this.text,
    this.icon,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.onPressed,
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
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: Colors.white,
              size: 32,
            ),
          if (icon != null && text != null) const SizedBox(width: 8),
          if (text != null) Text(text!, style: theme.bodyLarge?.copyWith(color: Colors.white)),
        ],
      ),
    );
  }
}