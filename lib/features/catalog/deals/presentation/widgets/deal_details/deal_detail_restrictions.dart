
import 'package:eisty/features/catalog/deals/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DealDetailRestrictions extends ConsumerWidget {
  
  final String dealId;
  const DealDetailRestrictions({super.key, required this.dealId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dealState = ref.watch(dealProvider(dealId));
    final deal = dealState.deal;
    
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            if(deal?.validFrom != null)
              Text('Restricciones:* Valido del ${deal!.validFrom.toString()} al ${deal.validUntil.toString()}.', 
              style: GoogleFonts.inter(
                color: Color(0xFFFDFDFD), 
                fontSize: 16, 
                fontStyle: FontStyle.italic),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,),
            const SizedBox(height: 8,),

          ],
        ),
        ),
    );
  }
}
