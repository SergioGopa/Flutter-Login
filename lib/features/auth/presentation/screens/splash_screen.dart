import 'package:animate_do/animate_do.dart';
import 'package:eisty/config/router/app_router_notifier.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  bool showLogo = false;
  bool showDecor = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 400), () {
      if (!mounted) return;
      setState(() => showLogo = true);
    });

    Future.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      setState(() => showDecor = true);
    });

    Future.delayed(const Duration(milliseconds: 2200), () {
      if (!mounted) return;
      ref.read(goRouterNotifierProvider).markSplashDone();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final clusterW = size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          if (showDecor) ...[
            Positioned(
              // top: 24,
              // right: 16,
              width: clusterW,
              // height: clusterH,
              child: FadeInDown(
                duration: const Duration(milliseconds: 500),
                child: Image.asset('assets/images/bestfood/ic_best_food_1.jpeg', fit: BoxFit.contain,))
              ),
            Positioned(
              bottom: 24,
              // left: 16,
              width: clusterW,
              // height: clusterH * 1.2,
              child: FadeInUp(
                duration: const Duration(milliseconds: 500),
                child: Image.asset('assets/images/bestfood/ic_best_food_1.jpeg', fit: BoxFit.contain,))
              )
          ],


          Center(
            child: AnimatedOpacity(
              opacity: showLogo ? 1 : 0,
              duration: const Duration(milliseconds: 500),
              child: ZoomIn(
                  duration: const Duration(milliseconds: 600),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/bestfood/ic_best_food_1.jpeg',
                        width: 96,
                        height: 96,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Sazan',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            letterSpacing: 1.2),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      const Text(
                        'Tu app de promos',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFFF1C40F)),
                      )
                    ],
                  )),
            ),
          )
        ],
      ),
    );
  }
}
