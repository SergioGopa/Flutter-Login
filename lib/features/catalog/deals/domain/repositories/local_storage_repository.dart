import 'package:eisty/features/catalog/deals/domain/domain.dart';

abstract class LocalStorageRepository {
  Future<void> toogleFavorite(Deal deal);

  Future<bool> isDealFavorite(String dealId);

  Future<List<Deal>> loadDeals({int limit = 10, offset = 0});
}