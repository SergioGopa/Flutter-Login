import 'package:eisty/features/shared/domain/entities/restaurant.dart';

class RestaurantsState {
  final bool isLoading;
  final bool isLastPage;
  final int offset;
  final int limit;

  final List<Restaurant> allRestaurants;
  final List<Restaurant> topRatedRestaurants;
  final List<Restaurant> nearbyRestaurants;

  final String selectedCateory;
  final String? errorMessage;
  final String searchQuery;

  RestaurantsState({
    this.isLoading = false,
    this.isLastPage = false,
    this.offset = 0,
    this.limit = 10,
    this.allRestaurants = const [],
    this.topRatedRestaurants = const [],
    this.nearbyRestaurants = const [],
    this.errorMessage,
    this.searchQuery = '',
    this.selectedCateory = '',
  });

  RestaurantsState copyWith({
    bool? isLoading,
    bool? isLastPage,
    int? offset,
    int? limit,
    List<Restaurant>? allRestaurants,
    List<Restaurant>? topRatedRestaurants,
    List<Restaurant>? nearbyRestaurants,
    String? errorMessage,
    String? searchQuery,
    String? selectedCateory,
  }) {
    return RestaurantsState(
      isLoading: isLoading ?? this.isLoading,
      isLastPage: isLastPage ?? this.isLastPage,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      allRestaurants: allRestaurants ?? this.allRestaurants,
      topRatedRestaurants: topRatedRestaurants ?? this.topRatedRestaurants,
      nearbyRestaurants: nearbyRestaurants ?? this.nearbyRestaurants,
      errorMessage: errorMessage ?? this.errorMessage,
      searchQuery: searchQuery ?? this.searchQuery,
      selectedCateory:selectedCateory??this.selectedCateory,
    );
  }
}
