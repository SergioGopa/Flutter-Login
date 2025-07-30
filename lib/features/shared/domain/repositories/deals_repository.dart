import 'package:eisty/features/shared/domain/entities/deal.dart';

abstract class DealsRepository {
  Future<List<Deal>> getFeaturedDeals();

  Future<List<Deal>> getPopularDeals();

  Future<List<Deal>> getUpcomingDeals();

  Future<List<Deal>> getDealsByCategory(String category);
  
  Future<List<Deal>> searchDeals(String query);

  Future<Deal> getDealByID(String id);

  Future<List<Deal>> getDealsByIds(List<String> ids);

  Future<List<Deal>> getDealsByPage({int limit = 10, int offset = 0});

}