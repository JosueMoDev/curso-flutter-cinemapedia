import 'package:flutter/material.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      elevation: 0,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'home'),
        BottomNavigationBarItem(icon: Icon(Icons.label_outline), label: 'categories'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline), label: 'favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'account'),
      ],
      selectedItemColor:colors.primary,
      unselectedItemColor: colors.secondary,
      showUnselectedLabels: true,
    );
  }
}