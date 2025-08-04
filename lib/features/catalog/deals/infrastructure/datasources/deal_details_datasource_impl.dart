import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:eisty/features/catalog/deals/domain/domain.dart';

class DealDetailsDatasourceImpl extends DealDetailsDatasource {
  Future<List<DealDetails>> _loadDealsDetails() async {
    
    final jsonString =
        await rootBundle.loadString('assets/mock/mock_deal_details.json');

    final List<dynamic> data = jsonDecode(jsonString);

    return data.map((item) {
      return DealDetails.fromJson(item);
    }).toList();
  }

  @override
  Future<DealDetails> getDealDetailsById(String id) async {
    final dealsDetails = await _loadDealsDetails();
    
    return dealsDetails.firstWhere(
      (deal) => deal.id == id,
      orElse: () => throw Exception('Deal not found'),
    );
  }
}
