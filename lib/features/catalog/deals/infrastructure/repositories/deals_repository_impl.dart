


import 'package:eisty/features/catalog/deals/domain/domain.dart';

class DealsRepositoryImpl extends DealsRepository {
  final DealsDatasource datasource;

  DealsRepositoryImpl(this.datasource);

  @override
  Future<List<Deal>> getDealsByCategory(String category) {
    return datasource.getDealsByCategory(category);
  }

  @override
  Future<List<Deal>> getFeaturedDeals() {
    return datasource.getFeaturedDeals();
  }

  @override
  Future<List<Deal>> getPopularDeals() {
    return datasource.getPopularDeals();
  }

  @override
  Future<List<Deal>> getUpcomingDeals() {
    return datasource.getUpcomingDeals();
  }

  @override
  Future<List<Deal>> searchDeals(String query) {
    return datasource.searchDeals(query);
  }

  @override
  Future<Deal> getDealByID(String id) {
    return datasource.getDealByID(id);
  }

  @override
  Future<List<Deal>> getDealsByPage({int limit = 10, int offset = 0}) {
    return datasource.getDealsByPage(limit: limit, offset: offset);
  }

  @override
  Future<List<Deal>> getDealsByIds(List<String> ids) {
    return datasource.getDealsByIds(ids);
  }
}
