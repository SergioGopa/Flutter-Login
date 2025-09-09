import 'package:eisty/features/catalog/deals/presentation/providers/deal_provider.dart';
import 'package:eisty/features/catalog/deals/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDetailHeader extends ConsumerWidget {
  final List<String> imageUrls;
  final String dealId;

  const DealDetailHeader(
      {super.key, required this.imageUrls, required this.dealId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealState = ref.watch(dealProvider(dealId));
    final deal = dealState.deal;

    return SliverToBoxAdapter(
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            child: PageView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  imageUrls[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          Positioned(
              top: 30,
              left: 16,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back_ios_new_outlined),
                      color: Colors.white,
                      iconSize: 35),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.share),
                        color: Colors.white,
                        iconSize: 35,
                      ),
                      if(deal != null)
                        FavoriteDealButton(deal: deal)
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
