import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:eisty/config/helpers/human_formats.dart';
import 'package:flutter/material.dart';

import 'package:eisty/features/catalog/deals/domain/domain.dart';

typedef SearchDealsCallback = Future<List<Deal>> Function(String query);

class SearchDealDelegate extends SearchDelegate<Deal?> {
  final SearchDealsCallback searchDeals;
  List<Deal> initialDeals;

  StreamController<List<Deal>> debounceDeals = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();

  Timer? _debounceTimer;

  SearchDealDelegate({
    required this.searchDeals,
    required this.initialDeals,
  });

  void clearStreams() {
    debounceDeals.close();
  }

  void _onQueryChanged(String query) {
    // print('Query String cambio');
    isLoadingStream.add(true);
    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(
      const Duration(milliseconds: 500),
      () async {
        
        final deals = await searchDeals(query);
        debounceDeals.add(deals);
        initialDeals = deals;
        // print('Query String STOPPED');
        await Future.delayed(const Duration(milliseconds: 300));
        isLoadingStream.add(false);
      },
    );
  }

  @override
  String? get searchFieldLabel => 'Buscar deals';

  Widget buildResultsAndSuggestions() {
    return StreamBuilder(
      initialData: initialDeals,
      stream: debounceDeals.stream,
      builder: (context, snapshot) {
        final deals = snapshot.data ?? [];
        return ListView.builder(
          itemCount: deals.length,
          itemBuilder: (context, index) {
            final deal = deals[index];
            return _DealItem(
              deal: deals[index],
              onDealSelected: (context, deal) {
                clearStreams();
                close(context, deal);
              },
            );
          },
        );
      },
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot) {
          if (snapshot.data ?? false) {
            return SpinPerfect(
              spins: 10,
              infinite: true,
              duration: const Duration(seconds: 1),
              child: IconButton(
                  onPressed: () => query = '',
                  icon: Icon(Icons.refresh_rounded)),
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            duration: const Duration(milliseconds: 200),
            child: IconButton(
                onPressed: () => query = '', icon: Icon(Icons.clear)),
          );
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _DealItem extends StatelessWidget {
  final Deal deal;
  final Function onDealSelected;

  const _DealItem(
      {super.key, required this.deal, required this.onDealSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onDealSelected(context, deal);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            //Image
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(deal.imageUrl),
              ),
            ),
            const SizedBox(
              width: 10,
            ),

            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    deal.title,
                    style: textStyles.titleMedium,
                  ),
                  (deal.description.length > 100)
                      ? Text('${deal.description.substring(0, 100)}...')
                      : Text(deal.description),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow.shade800,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(HumanFormats.number(deal.rating.toDouble(), 1))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
