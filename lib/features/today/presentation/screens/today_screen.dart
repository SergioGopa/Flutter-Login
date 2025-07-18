import 'package:eisty/features/today/today.dart';
import 'package:flutter/material.dart';

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              LocationHeaderWidget(city: 'Queretaro'),
              SearchBarWidget(),
              CategoryChipsWidget(),
              HeroCarouselWidget()
        
            ],
          ),
        ),
      ),
      
    );
  }
}