import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/domain/domain.dart';

class HeroCarouselWidget extends ConsumerWidget {
  final List<Deal> deals;

  const HeroCarouselWidget({
    required this.deals,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;

    if (deals.isEmpty) {
      return const SizedBox(
        height: 210,
        child: Center(child: Text('No featured deals available'),),
      );
    }

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: deals.length,
        itemBuilder: (context, index) {
          final deal = deals[index];

          return _Slide(deal: deal);
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Deal deal;

  const _Slide({
    super.key,
    required this.deal,
  });

  @override
  Widget build(BuildContext context) {
    final decoration =
        BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
      BoxShadow(color: Colors.black45, blurRadius: 10, offset: Offset(0, 10))
    ]);
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              deal.imageUrl,
              width: 25,
              height: 25,
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
