import 'package:eisty/features/shared/domain/domain.dart';
import 'package:eisty/features/today/presentation/providers.dart/all_deals_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dealsSlideshowProvider = Provider<List<Deal>?>((ref) {
  final allDeals = ref.watch(allDealsProvider);

  final featured = allDeals!
      .where(
        (deal) => deal.isFeatured,
      )
      .toList();
  return featured.length > 6 ? featured.sublist(0, 6) : featured;
});
