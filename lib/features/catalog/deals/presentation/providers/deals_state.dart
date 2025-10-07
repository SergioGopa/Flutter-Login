import 'package:eisty/features/catalog/deals/domain/domain.dart';

class DealsState {
  final bool isLoading;
  final bool isLastPage;
  final int offset;
  final int limit;

  final List<Deal> featuredDeals;
  final List<Deal> popularDeals;
  final List<Deal> upcomingDeals;
  final List<Deal> allDeals;
  final Map<String, dynamic> activeFilters;

  final String? errorMessage;
  final String selectedCategory;
  final String searchQuery;

  DealsState({
    this.isLastPage = false,
    this.offset = 0,
    this.limit = 10,
    this.allDeals = const [],
    this.isLoading = false,
    this.featuredDeals = const [],
    this.popularDeals = const [],
    this.upcomingDeals = const [],
    this.errorMessage,
    this.selectedCategory = '',
    this.searchQuery = '',
    this.activeFilters = const{}, 
  });

  DealsState copyWith({
    bool? isLoading,
    bool? isLastPage,
    int? offset,
    int? limit,
    List<Deal>? allDeals,
    List<Deal>? featuredDeals,
    List<Deal>? popularDeals,
    List<Deal>? upcomingDeals,
    String? errorMessage,
    String? selectedCategory,
    String? searchQuery,
    Map<String, dynamic>? activeFilters,
  }) {
    return DealsState(
      isLoading: isLoading ?? this.isLoading,
      isLastPage: isLastPage ?? this.isLastPage,
      offset: offset ?? this.offset,
      limit: limit ?? this.limit,
      allDeals: allDeals ?? this.allDeals,
      featuredDeals: featuredDeals ?? this.featuredDeals,
      popularDeals: popularDeals ?? this.popularDeals,
      upcomingDeals: upcomingDeals ?? this.upcomingDeals,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilters: activeFilters ?? this.activeFilters,
    );
  }
}
