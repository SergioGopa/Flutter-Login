import 'package:eisty/features/auth/presentation/providers/current_page_provider.dart';
import 'package:eisty/features/auth/presentation/providers/slide_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final PageController controller;

  final bool dotsUp;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBulletSize;
  final double secondaryBulletSize;

  const Slideshow({
    super.key,
    required this.slides,
    this.dotsUp = false,
    this.primaryColor = Colors.blue,
    this.secondaryColor = Colors.grey,
    this.primaryBulletSize = 12,
    this.secondaryBulletSize = 12,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final cfg = SlideShowConfig(
        dotsUp: dotsUp,
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
        primarySize: primaryBulletSize,
        secondarySize: secondaryBulletSize);

    return ProviderScope(
        overrides: [slideShowConfigProvider.overrideWithValue(cfg)],
        child: _SlideshowBody(slides: slides, controller: controller));
  }
}

class _SlideshowBody extends ConsumerWidget {
  final List<Widget> slides;
  final PageController controller;
  const _SlideshowBody(
      {super.key, required this.slides, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(slideShowConfigProvider);

    return Column(
      children: [
        if (cfg.dotsUp) const _Dots(),
        Expanded(
            child: PageView(
          controller: controller,
          children: slides.map(_Slide.new).toList(),
        )),
        if (!cfg.dotsUp) const _Dots(),
      ],
    );
  }
}

class _Dots extends ConsumerWidget {
  const _Dots();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cfg = ref.watch(slideShowConfigProvider);
    final currentPage = ref.watch(currentPageProvider);
    final total =
        context.findAncestorWidgetOfExactType<_SlideshowBody>()!.slides.length;

    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          total,
          (index) {
            final active =
                currentPage >= index - 0.5 && currentPage < index + 0.5;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: active ? cfg.primarySize:cfg.secondarySize,
              height: active ? cfg.primarySize:cfg.secondarySize,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: active ? cfg.primaryColor:cfg.secondaryColor,
                shape: BoxShape.circle
              ),
              );
          },
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget child;
  const _Slide(
    this.child,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: double.infinity,
      padding: const EdgeInsets.all(30),
      child: child,
    );
  }
}

