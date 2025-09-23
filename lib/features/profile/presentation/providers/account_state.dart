import 'package:eisty/features/shared/domain/domain.dart';

class AccountState {
  final User? user;
  final bool isLoading;
  final String? errorMessage;
  final String? successMessage;
  final String? passwordErrorMessage;


  AccountState({this.user, this.isLoading = false, this.errorMessage, this.successMessage, this.passwordErrorMessage});

  AccountState copyWith({
    User? user,
    bool? isLoading,
    String? errorMessage,
    String? successMessage,
    String? passwordErrorMessage,

  }) {
    return AccountState(
      user: user ?? this.user,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      successMessage: successMessage ?? this.successMessage,
      passwordErrorMessage : passwordErrorMessage ?? this.passwordErrorMessage
    );
  }
}
