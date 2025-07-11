import 'package:eisty/features/shared/infrastructure/services/secure_storage_service.dart';
import 'package:eisty/features/shared/infrastructure/services/secutre_storage_service_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final secureStorageServiceProvider = Provider<SecureStorageService>(
  (ref) {
    return SecutreStorageServiceImpl();
  },
);
