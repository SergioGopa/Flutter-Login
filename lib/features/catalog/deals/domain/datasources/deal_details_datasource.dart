import 'package:eisty/features/catalog/deals/domain/domain.dart';

abstract class DealDetailsDatasource {
  Future<DealDetails> getDealDetailsById(String id);
}
