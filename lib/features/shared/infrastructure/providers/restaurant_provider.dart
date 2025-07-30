import 'package:eisty/features/shared/domain/repositories/deals_repository.dart';
import 'package:eisty/features/shared/infrastructure/providers/deals_repository_provider.dart';
import 'package:eisty/features/shared/infrastructure/providers/restaurants_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eisty/features/shared/domain/domain.dart';
import 'package:eisty/features/shared/domain/repositories/restaurants_repository.dart';

final restaurantProvider = StateNotifierProvider.autoDispose
    .family<RestaurantNotifier, RestaurantState, String>(
  (ref, restaurantId) {
    final restaurantsRepository = ref.watch(restaurantsRepositoryProvider);
    final dealsRepository = ref.watch(dealsRepositoryProvider);
    return RestaurantNotifier(
        restaurantsRepository: restaurantsRepository,
        dealsRepository: dealsRepository,
        restaurantId: restaurantId);
  },
);

class RestaurantNotifier extends StateNotifier<RestaurantState> {
  final RestaurantsRepository restaurantsRepository;
  final DealsRepository dealsRepository;

  RestaurantNotifier(
      {required this.restaurantsRepository,
      required String restaurantId,
      required this.dealsRepository})
      : super(RestaurantState(id: restaurantId)) {
    loadRestaurant();
  }

  Future<void> loadRestaurant() async {
    try {
      final restaurant =
          await restaurantsRepository.getRestaurantById(state.id);

      final relatedDeals =
          await dealsRepository.getDealsByIds(restaurant.dealIds);

      state = state.copyWith(restaurant: restaurant, isLoading: false, deals: relatedDeals);

    } catch (e) {
      
      state = state.copyWith(
          isLoading: false, errorMessage: 'Restaurant not found');
    }
  }
}

class RestaurantState {
  final String id;
  final Restaurant? restaurant;
  final bool isLoading;
  final bool isSaving;
  final String? errorMessage;
  final List<Deal> deals;

  RestaurantState({
    required this.id,
    this.restaurant,
    this.isLoading = true,
    this.isSaving = false,
    this.errorMessage,
    this.deals = const [],
  });

  RestaurantState copyWith({
    String? id,
    Restaurant? restaurant,
    bool? isLoading,
    bool? isSaving,
    String? errorMessage,
    List<Deal>? deals,
  }) {
    return RestaurantState(
      id: id ?? this.id,
      restaurant: restaurant ?? this.restaurant,
      isLoading: isLoading ?? this.isLoading,
      isSaving: isSaving ?? this.isSaving,
      errorMessage: errorMessage ?? this.errorMessage,
      deals: deals ?? this.deals,
    );
  }
}
