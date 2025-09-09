import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DealDetailDescription extends StatelessWidget {
  final DealDetails deal;
  const DealDetailDescription({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Text(deal.description, style: GoogleFonts.inter(color: Color(0xFFFDFDFD), fontSize: 16),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,),
            const SizedBox(height: 8,),

          ],
        ),
        ),
    );
  }
}
