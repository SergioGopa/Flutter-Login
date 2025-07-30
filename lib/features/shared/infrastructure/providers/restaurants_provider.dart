import 'package:eisty/features/shared/infrastructure/providers/restaurants_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eisty/features/shared/domain/repositories/restaurants_repository.dart';
import 'package:eisty/features/shared/infrastructure/providers/restaurants_state.dart';

final restaurantsProvider =
    StateNotifierProvider<RestaurantsNotifier, RestaurantsState>(
  (ref) {
    final restaurantsRepository = ref.watch(restaurantsRepositoryProvider);
    return RestaurantsNotifier(restaurantsRepository);
  },
);

class RestaurantsNotifier extends StateNotifier<RestaurantsState> {
  final RestaurantsRepository restaurantsRepository;

  RestaurantsNotifier(this.restaurantsRepository) : super(RestaurantsState()) {
    loadNextPage();
  }

  //Load top rated restaurants
  Future<void> loadTopRatedRestaurants() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final restaurants = await restaurantsRepository.getTopRatedRestaurants();
      state =
          state.copyWith(isLoading: false, topRatedRestaurants: restaurants);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  //Load nearby restaurants
  Future<void> loadNearByRestaurants() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final restaurants = await restaurantsRepository.getNearbyRestaurants();
      state = state.copyWith(isLoading: false, nearbyRestaurants: restaurants);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  //search Restaurants
  Future<void> searchRestaurants(String query) async {
    state = state.copyWith(isLoading: true, searchQuery: query);

    try {
      final restaurants = await restaurantsRepository.searchRestaurants(query);
      state =
          state.copyWith(isLoading: false, topRatedRestaurants: restaurants);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  //loads Restaurants by Category
  Future<void> loadRestaurantsByCategory(String category) async {
    state = state.copyWith(isLoading: true, selectedCateory: category);

    try {
      final restaurants =
          await restaurantsRepository.getRestaurantsByCategory(category);
      state =
          state.copyWith(isLoading: false, topRatedRestaurants: restaurants);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  //loadNextPage
  Future<void> loadNextPage() async {
    if (state.isLoading || state.isLastPage) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    final restaurants = await restaurantsRepository.getRestaurantsByPage(
        limit: state.limit, offset: state.offset);

    if (restaurants.isEmpty) {
      state = state.copyWith(isLoading: false, isLastPage: true);
      return;
    }

    final allRestaurants = [...state.allRestaurants, ...restaurants];

    state = state.copyWith(
      isLoading: false,
      isLastPage: false,
      offset: state.offset + state.limit,
      allRestaurants: allRestaurants,
      topRatedRestaurants: allRestaurants
          .where(
            (rest) => rest.isTopRated,
          )
          .toList(),
      nearbyRestaurants: allRestaurants
          .where(
            (rest) => rest.isNearby,
          )
          .toList(),
    );
  }
}
