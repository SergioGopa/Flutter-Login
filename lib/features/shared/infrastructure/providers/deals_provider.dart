import 'package:eisty/features/shared/domain/repositories/deals_repository.dart';
import 'package:eisty/features/shared/infrastructure/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dealsProvider = StateNotifierProvider<DealsNotifier, DealsState>(
  (ref) {
    final dealsRepository = ref.watch(dealsRepositoryProvider);
    return DealsNotifier(dealsRepository);
  },
);

class DealsNotifier extends StateNotifier<DealsState> {
  final DealsRepository dealsRepository;

  DealsNotifier(this.dealsRepository) : super(DealsState()) {
    loadNextPage();
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
      offset: state.offset+state.limit,
      allDeals: allDeals,
      featuredDeals: allDeals.where((d) => d.isFeatured,).toList(),
      popularDeals: allDeals.where((d) => d.isPopular,).toList(),
      upcomingDeals: allDeals.where((d) => d.isUpcoming,).toList(),
    );
  }
}
