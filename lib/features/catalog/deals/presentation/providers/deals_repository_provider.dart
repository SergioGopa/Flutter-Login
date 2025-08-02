
import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/infrastructure/infrastructure.dart';


import 'package:flutter_riverpod/flutter_riverpod.dart';

final dealsRepositoryProvider = Provider<DealsRepository>(
  (ref) {
    final datasource = DealsDatasourceImpl();
    final dealsRepository = DealsRepositoryImpl(datasource);
    return dealsRepository;
  },
);
