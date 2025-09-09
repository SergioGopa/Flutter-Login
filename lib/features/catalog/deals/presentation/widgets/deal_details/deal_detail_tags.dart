import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:flutter/material.dart';

class DealDetailTags extends StatelessWidget {
  final DealDetails deal;
  const DealDetailTags({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Wrap(
          spacing: 6,
          children: deal.tags.map((tag) => Chip(
              label: Text(tag, 
                style: TextStyle(color: Color(0xFFCB087B), fontWeight: FontWeight.bold, fontSize: 16),), 
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                  side: const BorderSide(
                    color:  Color(0xFFCB087B),
                    width: 1.5
                  )
                ),
                ),).toList()
        ),
      ),
    );
  }
}
