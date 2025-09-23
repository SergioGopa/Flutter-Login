import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  static const String name = 'support-screen';
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Support Screen'),
      ),
    );
  }
}