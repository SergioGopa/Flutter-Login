import 'package:eisty/features/shared/domain/repositories/deals_repository.dart';
import 'package:eisty/features/shared/infrastructure/datasources/deals_datasource_impl.dart';
import 'package:eisty/features/shared/infrastructure/repositories/deals_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dealsRepositoryProvider = Provider<DealsRepository>(
  (ref) {
    final datasource = DealsDatasourceImpl();
    final dealsRepository = DealsRepositoryImpl(datasource);
    return dealsRepository;
  },
);
