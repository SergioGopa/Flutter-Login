import 'package:eisty/features/catalog/deals/presentation/providers/deals_detail_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/domain.dart';

final dealDetailsProvider = StateNotifierProvider.autoDispose
    .family<DealsDetailsNotifier, DealDetailsState, String>(
  (ref, dealId) {
    final repository = ref.watch(dealsDetailsRepositoryProvider);
    return DealsDetailsNotifier(repository: repository, dealId: dealId);
  },
);

class DealsDetailsNotifier extends StateNotifier<DealDetailsState> {
  final DealDetailsRepository repository;

  DealsDetailsNotifier({
    required this.repository,
    required String dealId,
  }) : super(DealDetailsState(id: dealId)) {
    loadDealDetails();
  }

  Future<void> loadDealDetails() async {
    try {
      final details = await repository.getDealDetailsById(state.id);
      state = state.copyWith(dealDetails: details, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: 'Not found');
    }
  }
}

class DealDetailsState {
  final String id;
  final DealDetails? dealDetails;
  final bool isLoading;
  final String? errorMessage;

  DealDetailsState(
      {required this.id,
      this.dealDetails,
      this.isLoading = true,
      this.errorMessage});

  DealDetailsState copyWith({
    String? id,
    DealDetails? dealDetails,
    bool? isLoading,
    String? errorMessage,
  }) =>
      DealDetailsState(
        id: id ?? this.id,
        dealDetails: dealDetails ?? this.dealDetails,
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
