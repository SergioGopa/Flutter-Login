import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  static const String name = 'notifications-screen';
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Notifications Screen'),
      ),
    );
  }
}