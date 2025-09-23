import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  static const String name = 'faq-screen';
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('FAQ Screen'),
      ),
    );
  }
}