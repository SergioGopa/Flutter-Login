import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



import '../../../../restaurants/presentation/providers/providers.dart';

class DealDetailLocation extends ConsumerWidget {
  final String restaurantId;

  const DealDetailLocation({
    super.key,
    required this.restaurantId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantState = ref.watch(restaurantProvider(restaurantId));
    final restaurant = restaurantState.restaurant;

    if (restaurant == null) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    

    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Placeholder()],
        ),
      ),
    );
  }
}
