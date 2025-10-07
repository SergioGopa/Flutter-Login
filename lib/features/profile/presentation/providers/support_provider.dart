import 'package:eisty/features/profile/domain/domain.dart';
import 'package:eisty/features/profile/infrastructure/infrastructure.dart';
import 'package:eisty/features/shared/providers/shared_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supportProvider = StateNotifierProvider<SupportNotifier, SupportState>(
  (ref) {
    final secureStorageService = ref.read(secureStorageServiceProvider);
    final repository = SupportRepositoryImpl(
        datasource: SupportDatasourceImpl(secureStorageService));
    return SupportNotifier(repository: repository);
  },
);

class SupportState {
  final bool isLoading;
  final String? successMessage;
  final String? errorMessage;

  SupportState(
      {this.isLoading = false, this.successMessage, this.errorMessage});

  SupportState copyWith({
    bool? isSending,
    String? successMessage,
    String? errorMessage,
  }) {
    return SupportState(
      isLoading: isSending ?? this.isLoading,
      successMessage: successMessage ?? this.successMessage,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class SupportNotifier extends StateNotifier<SupportState> {
  final SupportRepository repository;
  SupportNotifier({required this.repository}) : super(SupportState());

  Future<void> sendMessage({
    required String userId,
    required String subject,
    required String message,
  }) async {
    state = state.copyWith(
        isSending: true, errorMessage: null, successMessage: null);

    try {
      await repository.sendSupportMessage(
          userId: userId, subject: subject, message: message);
      state = state.copyWith(
          isSending: false, successMessage: "Mensaje enviado correctamente");
    } catch (e) {
      state = state.copyWith(isSending: false, errorMessage: e.toString());
    }
  }
}
