import 'package:eisty/features/today/presentation/providers.dart/all_deals_provider.dart';
import 'package:eisty/features/today/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allDeals = ref.watch(allDealsProvider);
    final dealsNotifier = ref.read(allDealsProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              LocationHeaderWidget(city: 'Queretaro'),
              SearchBarWidget(),
              CategoryChipsWidget(),
              HeroCarouselWidget(),
              DealHorizontalListview(
                deals: allDeals!,
                title: 'Queretaro',
                subTitle: 'Jueves 30',
                loadNextPage: () {
                  print('LLamado del padre');
                  dealsNotifier.loadNextPage();
                },
              ),
              DealHorizontalListview(
                deals: allDeals!,
                title: 'Populares',
                subTitle: 'Jueves 30',
                loadNextPage: () {
                  print('LLamado del padre');
                  dealsNotifier.loadNextPage();
                },
              ),
              DealHorizontalListview(
                deals: allDeals!,
                title: 'Mejor Calificadas',
                subTitle: 'Jueves 30',
                loadNextPage: () {
                  print('LLamado del padre');
                  dealsNotifier.loadNextPage();
                },
              ),
              const SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}
