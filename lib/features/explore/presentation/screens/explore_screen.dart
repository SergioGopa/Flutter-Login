import 'package:eisty/features/catalog/deals/presentation/providers/deals_provider.dart';
import 'package:eisty/features/today/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../catalog/deals/presentation/widgets/widgets.dart';

class ExploreScreen extends ConsumerStatefulWidget {
  const ExploreScreen({super.key});

  @override
  ConsumerState<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends ConsumerState<ExploreScreen> {
    @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dealsState = ref.watch(dealsProvider);
    final dealsNotifier = ref.read(dealsProvider.notifier);
    // final restaurantState = ref.watch(restaurantsProvider);
    // final restaurantsNotifier = ref.read(restaurantsProvider.notifier);

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
                    Divider(color: Color(0xFFCB087B),thickness: 3,),
                    DealHorizontalListviewTop10(
                      deals: dealsState.featuredDeals,
                      title: 'Top 10 : Lugares imperdibles',
                      loadNextPage: () {
                        dealsNotifier.loadNextPage();
                      },
                      isLastPage: dealsState.isLastPage,
                    ),
                    Divider(color: Color(0xFFFCD73D),thickness: 3,indent: 30,endIndent: 30,),
                    DealVerticalListview(
                      title: 'Las Mejores Promos',
                      deals: dealsState.featuredDeals
                      ),
                    
                    Divider(color: Color(0xFFFCD73D),thickness: 3,indent: 30,endIndent: 30,),
                    DealVerticalListview(
                      title: 'Promos pupulares',
                      deals: dealsState.popularDeals
                      ),
                    
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                )
              )
            ]
        ),
      ),
    );
  }
}