import 'package:eisty/features/auth/presentation/providers/providers.dart';
import 'package:eisty/features/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:eisty/features/shared/providers/key_value_storage_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final goRouterNotifierProvider = ChangeNotifierProvider((ref) {
    final authNotifier = ref.watch(authProvider.notifier);
    final keyValueStorage = ref.watch(keyValueStorageServiceProvider);

    return GoRouterNotifier(authNotifier, keyValueStorage);
  }    
);

class GoRouterNotifier extends ChangeNotifier {
  // final AuthNotifier _authNotifier;
  final AuthNotifier _authNotifier;
  final KeyValueStorageService _keyValueStorage;

  AuthStatus _authStatus = AuthStatus.checking;
  bool _hasCompletedOnboarding = false;

  GoRouterNotifier(this._authNotifier, this._keyValueStorage) {
    _authNotifier.addListener(
      (state) {
        _authStatus = state.authStatus;
        notifyListeners();
      },
    );
    _init();
  }

  AuthStatus get authStatus => _authStatus;
  bool get hasCompletedOnboarding => _hasCompletedOnboarding;

  Future<void> _init() async {
    final completed =
        await _keyValueStorage.getValue<bool>('onboarding_completed');
    _hasCompletedOnboarding = completed ?? false;
    notifyListeners();
  }

  Future<void> setOnboardingCompleted(bool value) async {
    await _keyValueStorage.setKeyValue('onboarding_completed', value);
    _hasCompletedOnboarding = value;
    notifyListeners();
  }

  Future<void> clearOnboarding() async {
    await _keyValueStorage.removeKey('onboarding_completed');
    _hasCompletedOnboarding = false;
    notifyListeners();
  }

  set authStatus(AuthStatus value) {
    _authStatus = value;
    notifyListeners();
  }
}
