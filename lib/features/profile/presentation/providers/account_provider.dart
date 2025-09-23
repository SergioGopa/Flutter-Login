import 'package:eisty/features/profile/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final accountProvider = StateNotifierProvider<AccountNotifier, AccountState>(
  (ref) {
    final profileRepository = ref.watch(profileRepositoryProvider);
    
    return AccountNotifier(
        profileRepository: profileRepository);
  },
);
