import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eisty/config/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<ThemeData> {
  bool isDarkMode;

  ThemeNotifier({
    this.isDarkMode = false,
  }) : super(SazanTheme.getTheme(isDarkmode: isDarkMode)){_loadTheme();}

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMode = prefs.getBool('isDarkMode') ?? false;
    state = SazanTheme.getTheme(isDarkmode: isDarkMode);
  }

  void toggleDarkMode() async {
    isDarkMode = !isDarkMode;
    state = SazanTheme.getTheme(isDarkmode: isDarkMode);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', isDarkMode);
  }
}

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, ThemeData>(
  (ref) {
    return ThemeNotifier();
  },
);
