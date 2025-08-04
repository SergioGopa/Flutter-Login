import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:flutter/material.dart';

class DealDetailTitlePrice extends StatelessWidget {
  final DealDetails deal;
  const DealDetailTitlePrice({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    final textSize = Theme.of(context).textTheme;
    
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(deal.title, style: textSize.titleLarge,),
            const SizedBox(height: 4,),
            Text(deal.description, style: textSize.bodySmall,),
            const SizedBox(height: 8,),
            Row(
              children: [
                if(deal.originalPrice != null)
                  Text("\$${deal.originalPrice}", style: const TextStyle(decoration: TextDecoration.lineThrough),),
                  const SizedBox(width: 6,),
                  Text("\$${deal.price}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  if(deal.promoTag != null)
                    Container(
                      margin: const EdgeInsets.only(left:8),
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.circular(4)),
                      child: Text(deal.promoTag!, style: TextStyle(color: Colors.white),),
                    )
              ],
            )

          ],
        ),
        ),
    );
  }
}
