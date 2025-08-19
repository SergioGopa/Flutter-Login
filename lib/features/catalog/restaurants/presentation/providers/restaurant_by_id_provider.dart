import 'package:eisty/features/catalog/restaurants/domain/domain.dart';
import 'package:eisty/features/catalog/restaurants/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantByIdProvider = FutureProvider.family<Restaurant?, String>(
  (ref, id) async {
    final repository = ref.watch(restaurantsRepositoryProvider);
    final restaurant = await repository.getRestaurantById(id);
    return restaurant;
  },
);
