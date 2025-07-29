import 'package:eisty/features/shared/domain/domain.dart';
import 'package:eisty/features/shared/domain/repositories/deals_repository.dart';
import 'package:eisty/features/shared/infrastructure/providers/deals_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dealProvider =
    StateNotifierProvider.autoDispose.family<DealNotifier, DealState, String>(
  (ref, dealId) {
    final dealsRepository = ref.watch(dealsRepositoryProvider);
    return DealNotifier(dealsRepository: dealsRepository, dealId: dealId);
  },
);

class DealNotifier extends StateNotifier<DealState> {
  final DealsRepository dealsRepository;

  DealNotifier({required this.dealsRepository, required String dealId})
      : super(DealState(id: dealId)) {
    loadDeal();
  }

  Future<void> loadDeal() async {
    try {
      final deal = await dealsRepository.getDealByID(state.id);
      state = state.copyWith(deal: deal, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: 'Deal not foung');
    }
  }
}

class DealState {
  final String id;
  final Deal? deal;
  final bool isLoading;
  final bool isSaving;
  final String? errorMessage;

  DealState({
    required this.id,
    this.deal,
    this.isLoading = true,
    this.isSaving = false,
    this.errorMessage,
  });

  DealState copyWith({
    String? id,
    Deal? deal,
    bool? isLoading,
    bool? isSaving,
    String? errorMessage,
  }) =>
      DealState(
        id: id ?? this.id,
        deal: deal ?? this.deal,
        isLoading: isLoading ?? this.isLoading,
        isSaving: isSaving ?? this.isSaving,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
