import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/providers.dart';
import 'package:eisty/features/catalog/deals/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDetailRelated extends ConsumerWidget {
  final List<String> relatedDealIds;

  const DealDetailRelated({super.key, required this.relatedDealIds});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final relatedDeals = ref.watch(dealsByIdsProvider(relatedDealIds));

    return relatedDeals.when(
        data: (List<Deal> relatedDeals) {
          return SliverToBoxAdapter(
            child: DealHorizontalListview(deals: relatedDeals),
          );
        },
        error: (error, stackTrace) => SliverToBoxAdapter(child: Center(child: Text('Error loading related deals'),),),
        loading: () => const SliverToBoxAdapter(child: Center(child: CircularProgressIndicator(),),),
        );
  }
}
