import 'package:animate_do/animate_do.dart';
import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DealPosterLink extends StatelessWidget {
  final Deal deal;

  const DealPosterLink({super.key, required this.deal});

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      child: GestureDetector(
        onTap: () => context.push('/deals/${deal.id}'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(deal.imageUrl, fit:  BoxFit.cover,),
        ),

      )
      );
  }
}
