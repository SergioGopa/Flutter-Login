import 'package:flutter/material.dart';

class PreferencesScreen extends StatelessWidget {
  static const String name = 'preferences-screen';
  const PreferencesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Preferences Screen'),
      ),
    );
  }
}