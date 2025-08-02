import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomBottomNavbar extends ConsumerWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex, 
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)]),
      child: BottomNavigationBar(
          currentIndex: currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.blue,
          backgroundColor: Colors.white,
          onTap: onTabSelected,
          // type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.today,
              ),
              label: 'Today',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favorites'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
