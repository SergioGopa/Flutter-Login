import 'package:eisty/features/catalog/deals/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider(
  (ref) {
    return LocalStorageRepositoryImpl(datasource: IsarDatasource());
  },
);
