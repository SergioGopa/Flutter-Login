import 'package:eisty/features/shared/infrastructure/services/key_value_storage_service.dart';
import 'package:eisty/features/shared/infrastructure/services/key_value_storage_service_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final keyValueStorageServiceProvider = Provider<KeyValueStorageService>(
  (ref) {
    return KeyValueStorageServiceImpl();
  },
);
