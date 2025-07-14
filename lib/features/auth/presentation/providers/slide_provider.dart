import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class SlideShowConfig {
  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primarySize;
  final double secondarySize;

  SlideShowConfig(
      {
      required this.dotsUp,
      required this.primaryColor,
      required this.secondaryColor,
      required this.primarySize,
      required this.secondarySize});

  
}

final slideShowConfigProvider = Provider<SlideShowConfig>(
    (ref) => SlideShowConfig(
        dotsUp: false,
        primaryColor: Colors.blue,
        secondaryColor: Colors.grey,
        primarySize: 12,
        secondarySize: 12),
);

final currentProviderPage = StateProvider<double>(
  (ref) => 0,
);