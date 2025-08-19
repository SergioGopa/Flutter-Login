import 'package:eisty/features/catalog/deals/domain/domain.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl({required this.datasource});

  @override
  Future<bool> isDealFavorite(String dealId) {
    return datasource.isDealFavorite(dealId);
  }

  @override
  Future<List<Deal>> loadDeals({int limit = 10, offset = 0}) {
    return datasource.loadDeals(limit: limit, offset: offset);
  }

  @override
  Future<void> toogleFavorite(Deal deal) {
    return datasource.toogleFavorite(deal);
  }
}
