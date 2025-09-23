import 'package:flutter/material.dart';

class ActivityHistoryScreen extends StatelessWidget {
  static const String name = 'history-screen';
  const ActivityHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Activity History Screen'),
      ),
    );
  }
}