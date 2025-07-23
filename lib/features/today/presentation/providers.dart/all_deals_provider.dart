import 'package:eisty/features/shared/data/mock/mock_deals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/domain/domain.dart';

final allDealsProvider =
    StateNotifierProvider<DealsNotifier, List<Deal>>((ref) {
  return DealsNotifier(); // Later replace with fetched list
});

class DealsNotifier extends StateNotifier<List<Deal>> {
  bool isLoading = false;
  DealsNotifier() : super([...?featureDealsMock]);

  void loadNextPage() async {
    if (isLoading) return;

    isLoading = true;

    final nextBatch = featureDealsMock?.map(
          (deal) {
            return deal.copyWith(
              id: '${deal.id}-${state.length}',
              title: '${deal.title}(${state.length})',
            );
          },
        ).toList() ??
        [];

    state = [...state, ...nextBatch];
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}
