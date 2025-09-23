import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String name = 'about-screen';
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('About Screen'),
    );
  }
}