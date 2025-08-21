import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchQueryProvider = StateProvider(
  (ref) => '',
);

final searchedDealsProvider =
    StateNotifierProvider<SearchDealsNotifier, List<Deal>>(
  (ref) {
    final dealRepository = ref.read(dealsRepositoryProvider);

    return SearchDealsNotifier(
        searchDeals: dealRepository.searchDeals, ref: ref);
  },
);

typedef SearchDealsCallback = Future<List<Deal>> Function(String query);

class SearchDealsNotifier extends StateNotifier<List<Deal>> {
  final SearchDealsCallback searchDeals;
  final Ref ref;

  SearchDealsNotifier({required this.searchDeals, required this.ref})
      : super([]);

  Future<List<Deal>> searchDealsByQuery(String query) async {
    final List<Deal> deals = await searchDeals(query);

    ref.read(searchQueryProvider.notifier).update(
          (state) => query,
        );

    state = deals;
    return deals;
  }
}
