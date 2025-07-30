import 'package:eisty/features/shared/infrastructure/providers/providers.dart';
import 'package:eisty/features/today/presentation/widgets/deal_horizontal_listview.dart';
import 'package:eisty/features/today/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayScreen extends ConsumerWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealsState = ref.watch(dealsProvider);
    final restaurantState = ref.watch(restaurantsProvider);
    final dealsNotifier = ref.read(dealsProvider.notifier);
    final restaurantsNotifier = ref.read(restaurantsProvider.notifier);

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
          if (dealsState.isLoading || dealsState.allDeals.isEmpty)
            SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          else if (dealsState.errorMessage != null)
            SliverFillRemaining(
              child: Center(
                child: Text('Error: ${dealsState.errorMessage}'),
              ),
            )
          else
            SliverToBoxAdapter(
                
              child:  Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // LocationHeaderWidget(city: 'Queretaro'),
                  CategoryChipsWidget(),
                  HeroCarouselWidget(
                    deals: dealsState.featuredDeals,
                  ),
                  DealHorizontalListview(
                    deals: dealsState.featuredDeals,
                    title: 'Queretaro - Featured Deals',
                    subTitle: 'Jueves 30',
                    loadNextPage: () {
                      print('LLamado del padre');
                      dealsNotifier.loadNextPage();
                    },
                    isLastPage: dealsState.isLastPage,
                  ),
                  DealHorizontalListview(
                    deals: dealsState.popularDeals,
                    title: 'Populares',
                    subTitle: 'Jueves 30',
                    loadNextPage: () {
                      print('LLamado del padre');
                      dealsNotifier.loadNextPage();
                    },
                  ),
                  DealHorizontalListview(
                    deals: dealsState.upcomingDeals,
                    title: 'Mejor Calificadas',
                    subTitle: 'Jueves 30',
                    loadNextPage: () {
                      print('LLamado del padre');
                      dealsNotifier.loadNextPage();
                    },
                  ),
                  RestaurantHorizontalListview(
                    restaurants: restaurantState.nearbyRestaurants,
                    title: 'Nearby Restaurants',
                    subTitle: 'Hi',
                    loadNextPage: () {
                      restaurantsNotifier.loadNextPage();
                    },
                  ),
                  RestaurantHorizontalListview(
                    restaurants: restaurantState.topRatedRestaurants,
                    title: 'Top Rated',
                    subTitle: 'Hi',
                    loadNextPage: () {
                      restaurantsNotifier.loadNextPage();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              )
            )
        ]),
      ),
    );
  }
}
