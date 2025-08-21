import 'package:eisty/features/auth/presentation/providers/auth_provider.dart';
import 'package:formz/formz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:eisty/features/auth/inputs/inputs.dart';

final signupFormProvider =
    StateNotifierProvider.autoDispose<SignupFormNotifier, SignupFormState>(
  (ref) {
    final signupUserCallback = ref.watch(authProvider.notifier).registerUser;

    return SignupFormNotifier(signupUserCallback: signupUserCallback);
  },
);

//! 1. State del provider
class SignupFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;
  final Username username;

  SignupFormState(
      {this.isPosting = false,
      this.isFormPosted = false,
      this.isValid = false,
      this.email = const Email.pure(),
      this.password = const Password.pure(),
      this.username = const Username.pure()});

  SignupFormState copyWith({
    bool? isPosting,
    bool? isFormPosted,
    bool? isValid,
    Email? email,
    Password? password,
    Username? username,
  }) =>
      SignupFormState(
          isPosting: isPosting ?? this.isPosting,
          isFormPosted: isFormPosted ?? this.isFormPosted,
          isValid: isValid ?? this.isValid,
          email: email ?? this.email,
          password: password ?? this.password,
          username: username ?? this.username);

  @override
  String toString() {
    return '''
    SigninFormState:
      isPosting:$isPosting,
      isPosted:$isFormPosted,
      isValid:$isValid,
      email:$email,
      password:$password,
      username:$username,
    ''';
  }
}

//!2. Como implementamos un notifier
class SignupFormNotifier extends StateNotifier<SignupFormState> {
  final Function(String, String, String) signupUserCallback;

  SignupFormNotifier({
    required this.signupUserCallback,
  }) : super(SignupFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value);
    state = state.copyWith(
        email: newEmail,
        isValid: Formz.validate([newEmail, state.password, state.username]));
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value);
    state = state.copyWith(
        password: newPassword,
        isValid: Formz.validate([newPassword, state.email, state.username]));
  }

  onNameChanged(String value) {
    final newUserName = Username.dirty(value);
    state = state.copyWith(
        username: newUserName,
        isValid: Formz.validate([newUserName, state.email, state.password]));
  }

  onFormSubmit() async {
    _touchEveryField();

    state = state.copyWith(isPosting: true);

    if (!state.isValid) return;

    await signupUserCallback(
        state.email.value, state.password.value, state.username.value);

    state = state.copyWith(isPosting: false);
  }

  _touchEveryField() {
    final email = Email.dirty(state.email.value);
    final password = Password.dirty(state.password.value);
    final username = Username.dirty(state.username.value);

    state = state.copyWith(
        isFormPosted: true,
        email: email,
        password: password,
        isValid: Formz.validate([email, password, username]));
  }
}
