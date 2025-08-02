import 'package:eisty/features/catalog/deals/domain/domain.dart';

abstract class DealsDatasource {
  Future<List<Deal>> getFeaturedDeals();

  Future<List<Deal>> getPopularDeals();

  Future<List<Deal>> getUpcomingDeals();
  
  Future<Deal> getDealByID(String id);

  Future<List<Deal>> getDealsByIds(List<String> ids);

  Future<List<Deal>> getDealsByCategory(String category);
  
  Future<List<Deal>> searchDeals(String query);

  Future<List<Deal>> getDealsByPage({int limit = 10, int offset = 0});

}
