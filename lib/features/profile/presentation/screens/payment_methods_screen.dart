import 'package:flutter/material.dart';

class PaymentMethodsScreen extends StatelessWidget {
  static const String name = 'payment-screen';
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Payment Screen'),
      ),
    );
  }
}