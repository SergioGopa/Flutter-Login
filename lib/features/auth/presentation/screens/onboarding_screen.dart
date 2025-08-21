import 'package:eisty/config/router/app_router_notifier.dart';
import 'package:eisty/features/auth/presentation/providers/current_page_provider.dart';
import 'package:eisty/features/auth/presentation/widgets/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// class OnboardingScreen extends ConsumerWidget {
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

class OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _controller = PageController();
  final _slides = const [
    'assets/svgs/slide-1.svg',
    'assets/svgs/slide-2.svg',
    'assets/svgs/slide-3.svg',
    'assets/svgs/slide-3.svg',
    'assets/svgs/slide-3.svg',
  ];

  @override
  void initState() {
    _controller.addListener(
      () {
        ref.read(currentPageProvider.notifier).state = _controller.page ?? 0;
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  // Widget build(BuildContext context, WidgetRef ref) {
  Widget build(BuildContext context) {
    final currentPage = ref.watch(currentPageProvider);
    final isLastPage = currentPage >= _slides.length - 1.2;

    return Scaffold(
        appBar: AppBar(
          title: Text('data'),
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(
                child: Slideshow(
              controller: _controller,
              slides: _slides
                  .map(
                    (path) => SvgPicture.asset(path),
                  )
                  .toList(),
              primaryColor: Colors.pink,
              secondaryColor: Colors.green,
              primaryBulletSize: 20,
              secondaryBulletSize: 5,
              dotsUp: false,
            )),
            AnimatedOpacity(
              opacity: isLastPage ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: IgnorePointer(
                ignoring: !isLastPage,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        await ref
                            .read(goRouterNotifierProvider)
                            .setOnboardingCompleted(true);
                        _controller.jumpToPage(0);

                        if(context.mounted) context.go('/signin');
                      },
                      child: const Text('Continue')),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ))
        );
  }
}
