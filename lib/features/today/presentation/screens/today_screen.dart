import 'package:eisty/features/shared/infrastructure/providers/deals_provider.dart';
import 'package:eisty/features/today/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealsState = ref.watch(dealsProvider);
    final dealsNotifier = ref.read(dealsProvider.notifier);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverToBoxAdapter(
              child: SizedBox(
            height: 30,
          )),
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: SearchBarWidget(),
              centerTitle: true,
            ),
          ),

          if(dealsState.isLoading || dealsState.allDeals.isEmpty)
            SliverFillRemaining(
              child: Center(child: CircularProgressIndicator(),),
            )
          else if (dealsState.errorMessage !=null)
            SliverFillRemaining(
              child: Center(child: Text('Error: ${dealsState.errorMessage}'),),
            )
          else
            SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
              return Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // LocationHeaderWidget(city: 'Queretaro'),
                  // SearchBarWidget(),
                  // CategoryChipsWidget(),
                  // HeroCarouselWidget(deals: dealsState.featuredDeals,),
                  DealHorizontalListview(
                    deals: dealsState.featuredDeals,
                    title: 'Queretaro',
                    subTitle: 'Jueves 30',
                    loadNextPage: () {
                      print('LLamado del padre');
                      dealsNotifier.loadNextPage();
                    },
                  ),
                  // DealHorizontalListview(
                  //   deals: dealsState.popularDeals,
                  //   title: 'Populares',
                  //   subTitle: 'Jueves 30',
                  //   loadNextPage: () {
                  //     print('LLamado del padre');
                  //     dealsNotifier.loadNextPage();
                  //   },
                  // ),
                  // DealHorizontalListview(
                  //   deals: dealsState.upcomingDeals,
                  //   title: 'Mejor Calificadas',
                  //   subTitle: 'Jueves 30',
                  //   loadNextPage: () {
                  //     print('LLamado del padre');
                  //     dealsNotifier.loadNextPage();
                  //   },
                  // ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              );
            }, childCount: 10))
        ]),
      ),
    );
  }
}
