import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/deal_details_provider.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/deal_provider.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/providers.dart';
import 'package:eisty/features/catalog/deals/presentation/widgets/deal_details/deal_detail_restrictions.dart';
import 'package:eisty/features/catalog/deals/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDetailScreen extends ConsumerWidget {
  static const name = 'deal-detail';

  final String dealId;
  const DealDetailScreen({
    super.key,
    required this.dealId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealState = ref.watch(dealDetailsProvider(dealId));
    final dealState2 = ref.watch(dealProvider(dealId));
    final deal = dealState2.deal;
    

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

    final dealdetails = dealState.dealDetails;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          DealDetailHeader(
            imageUrls: dealdetails!.imageUrls,
            dealId: dealdetails.id,
            // deal: dealState.dealDetails,
          ),
          DealDetailTitle(
            deal: dealdetails,
          ),
          DealDetailRestaurantCard(
            restaurantId: dealdetails.restaurantId,
          ),
          DealDetailTags(deal: dealdetails),
          DealDetailDescription(deal: dealdetails),
          DealDetailRestrictions(dealId: dealdetails.id,),
          SliverToBoxAdapter(child: Divider(color: Color(0xFFFCD73D),thickness: 3,indent: 30,endIndent: 30,),),

          SliverToBoxAdapter(
            child: Row(
              children: [
                //TODO: Need to add Restaurant info to data base
                DealDetailSchedule(restaurantId: dealdetails.restaurantId),
                DealDetailDays(restaurantId: dealdetails.restaurantId)
              ],
            )),
          DealDetailAddress(restaurantId: dealdetails.restaurantId),
          SliverToBoxAdapter(child: Divider(color: Color(0xFFFCD73D),thickness: 3,indent: 30,endIndent: 30,),),
          SliverToBoxAdapter(
            child: DealDetailStatus(
              restaurantId: dealdetails.restaurantId,
              dealId: dealdetails.id,
              )),
          DealDetailLocation(restaurantId: dealdetails.restaurantId),
          DealDetailRelated(
            relatedDealIds: dealdetails.relatedDealIds,
          ),
          // DealHorizontalListview(deals: deal),
          DealDetailReviews(
            reviews: dealdetails.reviews,
          ),
          DealDetailBottomBar(deal: dealdetails),
          SliverToBoxAdapter(child: const SizedBox(height: 70,)),
        ],
      ),
      bottomNavigationBar: DealDetailCountdown(
            restaurantId: dealdetails.restaurantId,
            endDate: deal?.validUntil ?? DateTime.now(),
            ),
    );
    
  }
}
