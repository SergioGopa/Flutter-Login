import 'package:eisty/features/catalog/restaurants/presentation/widgets/widgets.dart';
import 'package:eisty/features/today/today.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../catalog/deals/presentation/providers/providers.dart';
import '../../../catalog/deals/presentation/widgets/widgets.dart';
import '../../../catalog/restaurants/presentation/providers/providers.dart';

class TodayScreen extends ConsumerStatefulWidget {
  const TodayScreen({super.key});

  @override
  ConsumerState<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends ConsumerState<TodayScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CategoryChipsWidget(),
                    HeroCarouselWidget(
                      deals: dealsState.featuredDeals,
                    ),
                    DealHorizontalListview(
                      deals: dealsState.featuredDeals,
                      title: 'Queretaro - Featured Deals',
                      subTitle: 'Jueves 30',
                      loadNextPage: () {
                        dealsNotifier.loadNextPage();
                      },
                      isLastPage: dealsState.isLastPage,
                    ),
                    DealHorizontalListview(
                      deals: dealsState.popularDeals,
                      title: 'Populares',
                      subTitle: 'Jueves 30',
                      loadNextPage: () {
                        dealsNotifier.loadNextPage();
                      },
                      isLastPage: dealsState.isLastPage,
                    ),
                    DealHorizontalListview(
                      deals: dealsState.upcomingDeals,
                      title: 'Mejor Calificadas',
                      subTitle: 'Jueves 30',
                      loadNextPage: () {
                        dealsNotifier.loadNextPage();
                      },
                      isLastPage: dealsState.isLastPage,
                    ),
                    RestaurantHorizontalListview(
                      restaurants: restaurantState.nearbyRestaurants,
                      title: 'Nearby Restaurants',
                      subTitle: 'Hi',
                      loadNextPage: () {
                        restaurantsNotifier.loadNextPage();
                      },
                      isLastPage: restaurantState.isLastPage,
                    ),
                    RestaurantHorizontalListview(
                      restaurants: restaurantState.topRatedRestaurants,
                      title: 'Top Rated',
                      subTitle: 'Hi',
                      loadNextPage: () {
                        restaurantsNotifier.loadNextPage();
                      },
                      isLastPage: restaurantState.isLastPage,
                    ),
                    const SizedBox(
                      height: 30,
                    )
                  ],
                )
              )
            ]
        ),
      ),
    );
  }
}
