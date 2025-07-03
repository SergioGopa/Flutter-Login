import 'package:animate_do/animate_do.dart';
import 'package:eisty/config/theme/theme.dart';
import 'package:flutter/material.dart';


import 'package:eisty/config/constants/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 150.h,
              width: double.infinity,
            ),
            ElasticIn(
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeInOut,
              child: Image.asset(
                AppImages.splashImage,
                width: 150.w,
                height: 150.h,
                
              ),
            ),
            SizedBox(
              height: 30.h,
              width: double.infinity,
            ),
            Text('Your best deals here!',
              style: TextStyle(
                color: AppColors.primaryText,
                fontSize: 20.sp
              ),),
            SizedBox(
              height: 40.h,
              width: double.infinity,
            ),
            
          ],
        ),
      ),
    ));
  }
}
