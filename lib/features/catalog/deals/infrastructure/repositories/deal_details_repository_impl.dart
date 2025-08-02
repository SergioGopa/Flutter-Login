

import 'package:eisty/features/catalog/deals/domain/domain.dart';

class DealDetailsRepositoryImpl extends DealDetailsRepository {
  final DealDetailsDatasource datasource;

  DealDetailsRepositoryImpl(this.datasource);

  @override
  Future<DealDetails> getDealDetailsById(String id) {
    return datasource.getDealDetailsById(id);
  }
}
