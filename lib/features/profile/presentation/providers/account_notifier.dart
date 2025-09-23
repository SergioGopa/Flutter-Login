import 'package:eisty/features/auth/auth.dart';
import 'package:eisty/features/profile/domain/repositories/profile_repository.dart';
import 'package:eisty/features/profile/presentation/providers/providers.dart';
import 'package:eisty/features/shared/domain/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountNotifier extends StateNotifier<AccountState> {
  final ProfileRepository profileRepository;

  AccountNotifier({required this.profileRepository}) : super(AccountState());

  Future<void> loadUser(String id) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final user = await profileRepository.getUserById(id);
      state = state.copyWith(user: user, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> updateUser(User user) async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final updateUser = await profileRepository.updateUser(user);
      state = state.copyWith(user: updateUser, isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
    }
  }

  Future<void> changePassword(
      String id, String currentPassword, String newPassword) async {
    state = state.copyWith(
        isLoading: true, passwordErrorMessage: null, successMessage: null);

    try {
      final message = await profileRepository.changePassword(
          id, currentPassword, newPassword);
      state = state.copyWith(
          isLoading: false,
          successMessage: message,
          passwordErrorMessage: null);
    } on CustomError catch (e) {
      state = state.copyWith(
          isLoading: false,
          passwordErrorMessage: e.message,
          successMessage: null);
    } catch (e) {
      state = state.copyWith(
          isLoading: false,
          passwordErrorMessage: 'Error inesperado',
          successMessage: null);
    }
  }

  Future<void> deleteAccount(String id) async {
    try {
      await profileRepository.deleteAccount(id);
      state = AccountState();
    } catch (e) {
      state = state.copyWith(errorMessage: e.toString());
    }
  }

  void setUser(User user) {
    state = state.copyWith(user: user);
  }

  void clearMessage() {
    state = state.copyWith(successMessage: null, passwordErrorMessage: null);
  }
}
