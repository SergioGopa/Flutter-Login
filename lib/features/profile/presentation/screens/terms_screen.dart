import 'package:flutter/material.dart';

class TermsScreen extends StatelessWidget {
  static const String name = 'terms-screen';
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Terms Screen'),
      ),
    );
  }
}