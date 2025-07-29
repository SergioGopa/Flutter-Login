

import 'package:eisty/features/shared/domain/entities/deal.dart';

abstract class DealsDatasource {
  Future<List<Deal>> getFeaturedDeals();

  Future<List<Deal>> getPopularDeals();

  Future<List<Deal>> getUpcomingDeals();
  
  Future<Deal> getDealByID(String id);

  Future<List<Deal>> getDealsByCategory(String category);
  
  Future<List<Deal>> searchDeals(String query);

  Future<List<Deal>> getDealsByPage({int limit = 10, int offset = 0});

}
