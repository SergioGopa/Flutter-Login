import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';

import 'package:eisty/features/auth/inputs/inputs.dart';
import 'package:eisty/features/auth/presentation/providers/auth_provider.dart';

//!3 -  StateNotifierProvider - se consume afuera
final signinFormProvider =
    StateNotifierProvider.autoDispose<SigninFormNotifier, SigninFormState>(
        (ref) {
  final loginUserCallback = ref.watch(authProvider.notifier).loginUser;

  return SigninFormNotifier(loginUserCallback: loginUserCallback);
});

//! 1. State del provider
class SigninFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;

  SigninFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure()});

  SigninFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
  }) =>
      SigninFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  String toString() {
    return '''
    SigninFormState:
      isPosting:$isPosting,
      isPosted:$isFormPosted,
      isValid:$isValid,
      email:$email,
      password:$password,
    ''';
  }
}

//!2. Como implementamos un notifier
class SigninFormNotifier extends StateNotifier<SigninFormState> {
  final Function(String, String) loginUserCallback;

  SigninFormNotifier({
    required this.loginUserCallback,
  }) : super(SigninFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail, isValid: Formz.validate([newEmail, state.password]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.email]));
  }

  onFormSubmit() async {
    _touchEveryField();

    state = state.copyWith(isPosting: true);

    if (!state.isValid) return;
    
    await loginUserCallback(state.email.value, state.password.value);

    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);

    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password]));
  }
}
