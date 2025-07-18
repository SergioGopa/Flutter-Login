import 'package:eisty/features/shared/data/mock/mock_deals.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/domain/domain.dart';

final allDealsProvider = Provider<List<Deal>?>((ref) {
  return featureDealsMock; // Later replace with fetched list
});