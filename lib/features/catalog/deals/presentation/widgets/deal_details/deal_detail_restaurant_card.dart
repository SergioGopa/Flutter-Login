import 'package:eisty/features/catalog/restaurants/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DealDetailRestaurantCard extends ConsumerWidget {
  final String restaurantId;

  const DealDetailRestaurantCard({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantState = ref.watch(restaurantProvider(restaurantId));
    final textTheme = Theme.of(context).textTheme;

    if (restaurantState.isLoading) {
      return const SliverToBoxAdapter(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (restaurantState.errorMessage != null) {
      return SliverToBoxAdapter(
        child: Center(
          child: Text(restaurantState.errorMessage!),
        ),
      );
    }

    final restaurant = restaurantState.restaurant;

    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'restaurant-detail',
              arguments: restaurant!.id);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  restaurant!.imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurant.name,
                    style: textTheme.titleMedium,
                  ),
                  Text(restaurant.address, style: textTheme.bodySmall,),
                  const SizedBox(height: 4,),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber,size: 16,),
                      const SizedBox(width: 4,),
                      Text(restaurant.rating.toStringAsFixed(1))
                    ],
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
