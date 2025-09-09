import 'package:eisty/features/catalog/restaurants/presentation/providers/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DealDetailRestaurantCard extends ConsumerWidget {
  final String restaurantId;

  const DealDetailRestaurantCard({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantState = ref.watch(restaurantProvider(restaurantId));
    final textTheme = Theme.of(context).textTheme;
    final decoration =
        BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.25), 
              blurRadius: 10, 
              offset: Offset(0, 4))
    ]);

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
              Container(
                width: 80,
                height: 80,
                child: DecoratedBox(
                  decoration: decoration,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Image.asset(
                        restaurant!.imageUrl,
                      ),
                    ),
                  ),
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
                    style: GoogleFonts.inter(color: Color(0xFFFDFDFD), fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  // Text(restaurant.address, style: textTheme.bodySmall,),
                  // const SizedBox(height: 4,),
                  Row(
                    children: [
                      if (restaurant.categories.isNotEmpty)
                        Text(
                          restaurant.categories.take(2).join('-'),
                          style: GoogleFonts.inter(
                              color: Color(0xFFFDFDFD), fontSize: 16),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      Text(
                            " | ",
                            style: TextStyle(color: Color(0xFFFDFDFD)),
                          ),
                      Text(
                            '3 Km',
                            style: GoogleFonts.inter(
                                color: Color(0xFFFDFDFD), fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                      Text(
                            " | ",
                            style: TextStyle(color: Color(0xFFFDFDFD)),
                          ),
                      const Icon(Icons.star, color: Colors.amber,size: 16,),
                      const SizedBox(width: 4,),
                      Text(restaurant.rating.toStringAsFixed(1), style: GoogleFonts.inter(
                                color: Color(0xFFFDFDFD), fontSize: 16),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,)
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
