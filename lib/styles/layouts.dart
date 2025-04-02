import 'package:flutter/material.dart';

EdgeInsets customScreenPadding = const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0);

class MainLayout extends StatelessWidget {
  final Widget child;
  final String appBarText;

  const MainLayout({required this.child, required this.appBarText, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Scaffold(
          appBar: CustomAppBar(text: appBarText),
          body: child,
          bottomNavigationBar: const CustomBottomNavBar(),
        ),
      ),
    );
  }
}

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
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).bottomNavigationBarTheme;

    return BottomNavigationBar(
      selectedItemColor: theme.selectedItemColor,
      unselectedItemColor: theme.unselectedItemColor,
      showUnselectedLabels: theme.showUnselectedLabels,
      selectedIconTheme: theme.selectedIconTheme,
      unselectedIconTheme: theme.unselectedIconTheme,
      selectedLabelStyle: theme.selectedLabelStyle,
      unselectedLabelStyle: theme.unselectedLabelStyle,

      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: "Saved",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home Screen",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.help_outline),
          label: "Tips",
        ),
      ],
    );
  }
}
