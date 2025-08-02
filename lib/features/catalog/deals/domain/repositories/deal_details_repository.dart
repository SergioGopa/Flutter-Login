import 'package:eisty/features/catalog/deals/domain/domain.dart';

abstract class DealDetailsRepository {
  Future<DealDetails> getDealDetailsById(String id);
}