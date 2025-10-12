import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/presentation/providers/providers.dart';
import 'package:eisty/features/catalog/restaurants/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dealsProvider = StateNotifierProvider<DealsNotifier, DealsState>(
  (ref) {
    final dealsRepository = ref.watch(dealsRepositoryProvider);
    return DealsNotifier(dealsRepository, ref);
  },
);

class DealsNotifier extends StateNotifier<DealsState> {
  final DealsRepository dealsRepository;
  final Ref ref;

  DealsNotifier(this.dealsRepository, this.ref) : super(DealsState()) {
    loadNextPage();
  }

  void applyFilters(Map<String, dynamic> filters) {
    final cleanedFilters = Map<String, dynamic>.from(filters)
      ..removeWhere(
        (key, value) =>
            value == false || value == null || (value is List && value.isEmpty),
      );

    if (cleanedFilters.isEmpty) {
      state = state.copyWith(activeFilters: {});
    } else {
      state = state.copyWith(activeFilters: cleanedFilters);
    }
  }

  void clearFilters() {
    state = state.copyWith(activeFilters: {});
  }

  List<Deal> get filteredDeals {
    if (state.activeFilters.isEmpty) return state.allDeals;

    final filters = state.activeFilters;

    return state.allDeals.where(
      (deal) {
        final selectedCategories = filters['categories'] as List<String>?;

        if (selectedCategories != null && selectedCategories.isNotEmpty) {
          final matches = deal.categories.any(
            (category) => selectedCategories.contains(category),
          );
          if (!matches) return false;
        }

        //Open Now
        if ((filters['openNow'] ?? false) == true) {
          final restaurantState = ref.read(restaurantsProvider);

          final restaurantList = restaurantState.allRestaurants.where(
            (e) => e.id == deal.restaurantId,
          );
          final restaurant =
              restaurantList.isNotEmpty ? restaurantList.first : null;

          if (restaurant == null || !restaurant.isOpenNow()) {
            return false;
          }
        }

        //Valid Today filter
        final validToday = filters['validToday'] is bool
            ? filters['validToday'] as bool
            : false;

        if (validToday) {
          final now = DateTime.now();
          if (now.isBefore(deal.validFrom) || now.isAfter(deal.validUntil)) {
            return false;
          }
        }

        final selectedDays = filters['days'] as List<String>?;

        if (selectedDays != null && selectedDays.isNotEmpty) {
          final matchesDays = deal.validDaysOfWeek.any(selectedDays.contains);
          if (!matchesDays) return false;
        }

        //Popular filter
        if ((filters['popular'] ?? false) == true && !deal.isPopular) {
          return false;
        }

        //Featured filter
        if ((filters['featured'] ?? false) == true && !deal.isFeatured) {
          return false;
        }

        //nearby filter
        if ((filters['upcoming'] ?? false) == true && !deal.isUpcoming) {
          return false;
        }

        //Adults only
        if ((filters['adultsOnly'] ?? false) == true && !deal.adultsOnly) {
          return false;
        }

        //Pet Friendly
        if ((filters['petFriendly'] ?? false) == true && !deal.petFriendly) {
          return false;
        }

        //Delivery
        if ((filters['delivery'] ?? false) == true && !deal.delivery) {
          return false;
        }

        return true;
      },
    ).toList();
  }

  //Load Featured Deals
  Future<void> loadFeaturedDeals() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final deals = await dealsRepository.getFeaturedDeals();
      state = state.copyWith(isLoading: false, featuredDeals: deals);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  //Load popular Deals
  Future<void> loadPopularDeals() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final deals = await dealsRepository.getPopularDeals();
      state = state.copyWith(isLoading: false, popularDeals: deals);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  //Load upcoming Deals
  Future<void> loadUpcomingDeals() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final deals = await dealsRepository.getUpcomingDeals();
      state = state.copyWith(isLoading: false, upcomingDeals: deals);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  //Load Deals by Category
  Future<void> loadDealsByCategory(String category) async {
    state = state.copyWith(isLoading: true, selectedCategory: category);

    try {
      final deals = await dealsRepository.getDealsByCategory(category);
      state = state.copyWith(isLoading: false, featuredDeals: deals);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  //Search Deals
  Future<void> searchDeals(String query) async {
    state = state.copyWith(isLoading: true, searchQuery: query);

    try {
      final deals = await dealsRepository.searchDeals(query);
      state = state.copyWith(isLoading: false, featuredDeals: deals);
    } catch (e) {
      state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> loadNextPage() async {
    if (state.isLoading || state.isLastPage) return;

    state = state.copyWith(isLoading: true, errorMessage: null);

    final deals = await dealsRepository.getDealsByPage(
        limit: state.limit, offset: state.offset);

    if (deals.isEmpty) {
      state = state.copyWith(isLoading: false, isLastPage: true);
      return;
    }

    final allDeals = [...state.allDeals, ...deals];

    state = state.copyWith(
      isLoading: false,
      isLastPage: false,
      offset: state.offset + state.limit,
      allDeals: allDeals,
      featuredDeals: allDeals
          .where(
            (d) => d.isFeatured,
          )
          .toList(),
      popularDeals: allDeals
          .where(
            (d) => d.isPopular,
          )
          .toList(),
      upcomingDeals: allDeals
          .where(
            (d) => d.isUpcoming,
          )
          .toList(),
    );
  }
}
