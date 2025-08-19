import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dealsByIdsProvider = FutureProvider.family<List<Deal>, List<String>>(
  (ref, ids) async {
    final repository = ref.watch(dealsRepositoryProvider);
    final deals = await repository.getDealsByIds(ids);
    return deals;
  },
);
