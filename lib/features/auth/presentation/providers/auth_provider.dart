import 'package:eisty/features/auth/domain/domain.dart';
import 'package:eisty/features/auth/infrastructure/infrastructure.dart';
import 'package:eisty/features/shared/domain/domain.dart';
import 'package:eisty/features/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:eisty/features/shared/infrastructure/services/key_value_storage_service_impl.dart';
import 'package:eisty/features/shared/infrastructure/services/secure_storage_service.dart';
import 'package:eisty/features/shared/providers/shared_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository = AuthRepositoryImpl();
  final keyValueStorageService = KeyValueStorageServiceImpl();
  final secureStorageService = ref.read(secureStorageServiceProvider);

  return AuthNotifier(
      authRepository: authRepository,
      keyValueStorageService: keyValueStorageService,
      secureStorageService: secureStorageService);
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;
  final KeyValueStorageService keyValueStorageService;
  final SecureStorageService secureStorageService;

  AuthNotifier({
    required this.authRepository,
    required this.keyValueStorageService,
    required this.secureStorageService,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final authResult = await authRepository.login(email, password);
      // await keyValueStorageService.setKeyValue('token', authResult.token);
      await secureStorageService.saveToken(authResult.token);
      // await secureStorageService

      _setLoggedUser(authResult.user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Error no controlado: }');
    }
  }

  void registerUser(String email, String password, String fullName) async {
    await Future.delayed(const Duration(milliseconds: 500));

    try {
      final authResult =
          await authRepository.register(email, password, fullName);

      // await keyValueStorageService.setKeyValue('token', authResult.token);
      await secureStorageService.saveToken(authResult.token);

      _setLoggedUser(authResult.user);
    } on CustomError catch (e) {
      logout(e.message);
    } catch (e) {
      logout('Unexpected error');
    }
  }

  void checkAuthStatus() async {
    // final token = await keyValueStorageService.getValue<String>('token');
    final token = await secureStorageService.getToken();

    if (token == null) return logout();

    try {
      final authResult = await authRepository.checkAuthStatus(token);

      // await keyValueStorageService.setKeyValue('token', authResult.token);
      await secureStorageService.saveToken(authResult.token);
      _setLoggedUser(authResult.user);
    } catch (e) {
      logout();
    }
  }

  void _setLoggedUser(User user) {
    state = state.copyWith(
        authStatus: AuthStatus.authenticated, user: user, errorMessage: '');
  }

  Future<void> logout([String? errorMessage]) async {
    // await keyValueStorageService.removeKey('token');
    await secureStorageService.deleteToken();
    
    //Clean token
    state = state.copyWith(
        authStatus: AuthStatus.notAuthenticated,
        user: null,
        errorMessage: errorMessage);
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final User? user;
  final String errorMessage;

  AuthState(
      {this.authStatus = AuthStatus.checking,
      this.user,
      this.errorMessage = ''});

  AuthState copyWith(
          {AuthStatus? authStatus, User? user, String? errorMessage}) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
