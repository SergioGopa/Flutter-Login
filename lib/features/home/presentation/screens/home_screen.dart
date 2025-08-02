import 'package:eisty/features/explore/explore.dart';
import 'package:eisty/features/favorites/favorites.dart';
import 'package:eisty/features/home/home.dart';
import 'package:eisty/features/profile/profile.dart';
import 'package:eisty/features/today/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const String name = 'home-screen';
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _currentIndex = 3;

  final List<Widget> _screens = const [
    TodayScreen(),
    ExploreScreen(),
    FavoritesScreen(),
    ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: _currentIndex,
        onTabSelected: _onTabSelected,
        ),
    );
  }
}
