import 'package:flutter/material.dart';

class PrivacyScreen extends StatelessWidget {
  static const String name = 'privacy-screen';
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Privacy Screen'),
      ),
    );
  }
}