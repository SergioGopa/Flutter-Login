import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../restaurants/presentation/providers/providers.dart';

class DealDetailAddress extends ConsumerWidget {
  
  final String restaurantId;
  const DealDetailAddress({
    super.key,
    required this.restaurantId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantState = ref.watch(restaurantProvider(restaurantId));
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text(
              restaurantState.restaurant?.address??'No Location', 
              style: GoogleFonts.inter(color: Color(0xFFFDFDFD), fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,),
            const SizedBox(height: 8,),

          ],
        ),
        ),
    );
  }
}
