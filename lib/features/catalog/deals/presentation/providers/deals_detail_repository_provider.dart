import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dealsDetailsRepositoryProvider = Provider<DealDetailsRepository>(
  (ref) {
    final datasource = DealDetailsDatasourceImpl();
    final dealsDetailsRepository = DealDetailsRepositoryImpl(datasource);

    return dealsDetailsRepository;
  },
);
