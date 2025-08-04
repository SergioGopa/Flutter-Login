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
          children: deal.tags.map((tag) => Chip(label: Text(tag), backgroundColor: Colors.grey[200],),).toList()
        ),
      ),
    );
  }
}
