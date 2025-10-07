import 'package:eisty/config/theme/theme.dart';
import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../restaurants/presentation/providers/providers.dart';


class DealPromoCard extends ConsumerWidget {
  final Deal deal;
  final int index;

  const DealPromoCard({super.key, required this.deal, required this.index});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantAsync =
        ref.watch(restaurantByIdProvider(deal.restaurantId));
    final double cardWidth = 280.0;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      padding: const EdgeInsets.all(10),
      height: 150,
      width: cardWidth,
      decoration: BoxDecoration(
        color: Colors.grey[850],
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ]
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Image
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GestureDetector(
              onTap: () {
                context.push('/deals/${deal.id}');
              },
              child: Image.asset(
                deal.imageUrl,
                width: 130,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(width: 15,),
          restaurantAsync.when(
            data: (restaurant) {
              if (restaurant == null) return const SizedBox();

              return Expanded(
                  child: Stack(
                    children:[ 
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20,),
                          Text(
                            deal.title,
                            style: AppTextStyles.t1Bold.copyWith(
                                  color: AppColors.blancoSazan),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                          const SizedBox(height: 20,),
                          if (restaurant.categories.isNotEmpty)
                            Text(
                              restaurant.categories.take(2).join('/'),
                              style: AppTextStyles.t2Regular.copyWith(
                                  fontSize: 12,
                                  color: AppColors.blancoSazan),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Spacer(),

                            Row(
                            children: [
                              //TODO: Distance
                              Text('3 Km',
                              style: AppTextStyles.t2Regular.copyWith(
                                fontSize: 12,
                                color: AppColors.blancoSazan),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,),
                              Spacer(),
                              Text(restaurant.name,
                              style: AppTextStyles.t2Regular.copyWith(
                                  color: AppColors.blancoSazan),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,),
                              const SizedBox(width: 5,),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.grey[200],
                                      border: Border.all(color: Colors.white, width: 2)
                                    ),
                                    child: ClipOval(
                                      child: Image.asset(restaurant.imageUrl, width: 20, height: 20, ),
                                    ),
                                  ),
                                  Positioned(
                                    right: -2,
                                    top: -2,
                                    child: Container(
                                      width: 12,
                                      height: 12,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.green,
                                      ),
                                    )
                                  )
                                ],
                              )
                            ],
                          ),                          
                        ],
                      ),
                      Positioned(right: 0,top: 0,child: FavoriteDealButton(deal: deal)),
                    ]
                  )
                );
            },
            error: (error, stackTrace) => Text('Error: $error'),
            loading: () => const SizedBox(
            height: 32,
            ),
          ),
        ],
      ),
    );
  }
}