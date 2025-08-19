import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteDealsProvider =
    StateNotifierProvider<StorageDealsNotifier, Map<String, Deal>>(
  (ref) {
    final localStorageRepository = ref.watch(localStorageRepositoryProvider);
    return StorageDealsNotifier(localStorageRepository: localStorageRepository);
  },
);

class StorageDealsNotifier extends StateNotifier<Map<String, Deal>> {
  int page = 0;
  final LocalStorageRepository localStorageRepository;
  StorageDealsNotifier({required this.localStorageRepository}) : super({});

  Future<List<Deal>> loadNextPage() async {
    final deals =
        await localStorageRepository.loadDeals(offset: page * 10, limit: 20);
    page++;

    final tempDealsMap = <String, Deal>{};
    for (final deal in deals) {
      tempDealsMap[deal.id] = deal;
    }

    state = {...state, ...tempDealsMap};

    return deals;
  }

  Future<void> toggleFavorite(Deal deal) async {
    await localStorageRepository.toogleFavorite(deal);
    final bool isDealInFavorites = state[deal.id] != null;

    if (isDealInFavorites) {
      state.remove(deal.id);
      state = {...state};
    } else {
      state = {...state, deal.id: deal};
    }
  }
}
