import 'package:eisty/features/profile/domain/domain.dart';
import 'package:eisty/features/profile/infrastructure/infrastructure.dart';
import 'package:eisty/features/shared/providers/shared_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileRepositoryProvider = Provider<ProfileRepository>(
  (ref) {
    final secureStorageService = ref.watch(secureStorageServiceProvider);
    return ProfileRepositoryImpl(secureStorageService: secureStorageService);
  },
);
