import 'package:eisty/features/catalog/deals/presentation/providers/deal_details_provider.dart';
import 'package:eisty/features/catalog/deals/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDetailScreen extends ConsumerWidget {
  static const name = 'deal-detail';

  final String dealId;
  const DealDetailScreen({super.key, required this.dealId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealState = ref.watch(dealDetailsProvider(dealId));

    if (dealState.isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    if (dealState.errorMessage != null) {
      return Center(
        child: Text(dealState.errorMessage!),
      );
    }

    final deal = dealState.dealDetails;
    // print(deal!.imageUrls);
    return Scaffold(
      appBar: AppBar(
        title: Text('DealID: $dealId'),
      ),
      body: CustomScrollView(
        slivers: [
          DealDetailHeader(
            imageUrls: deal!.imageUrls,
          ),
          DealDetailTitlePrice(deal: deal,),
          DealDetailTags(deal: deal)
          
        ],
      ),
    );
  }
}
