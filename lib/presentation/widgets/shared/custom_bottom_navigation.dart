import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomNavigationBar extends StatelessWidget {
  final int currentIndex;
  const CustomNavigationBar({super.key, required this.currentIndex});

  void onItemTapped(BuildContext context, int index) {
    switch (index){
      case 0:
      return context.go('/home/0');
      case 1:
      return context.go('/home/1');
      case 2:
      return context.go('/home/2');
      case 3: 
      return context.go('/home/3');
      default:
      return context.go('/home/0');
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return BottomNavigationBar(
      onTap: (value) => onItemTapped(context, value),
      currentIndex: currentIndex,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_filled),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),
          label: 'categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'favorites',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'account',
        ),
      ],
      selectedItemColor: colors.primary,
      unselectedItemColor: colors.secondary,
      showUnselectedLabels: true,
    );
  }
}
