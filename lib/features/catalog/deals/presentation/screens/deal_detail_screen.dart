import 'package:flutter/material.dart';

class DealDetailScreen extends StatelessWidget {
  static const name = 'deal-detail';

  final String dealId;
  const DealDetailScreen({super.key, required this.dealId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DealID: $dealId'),
      ),
    );
  }
}
