import 'dart:convert';


import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:flutter/services.dart';

class DealsDatasourceImpl extends DealsDatasource {
  Future<List<Deal>> _loadDeals() async {
    // 1.Load the mock JSON file from assets
    final jsonString =
        await rootBundle.loadString('assets/mock/mock_deals.json');

    // 2. Decode JSON into a List<dynamic>
    final List<dynamic> data = jsonDecode(jsonString);

    // 3. Map JSON to Deal objects
    return data
        .map(
          (item) => Deal.fromJson(item),
        )
        .toList();
  }

  @override
  Future<List<Deal>> getDealsByCategory(String category) async {
    final deals = await _loadDeals();

    return deals
        .where(
          (deal) => deal.categories.contains(category),
        )
        .toList();
  }

  @override
  Future<List<Deal>> getFeaturedDeals() async {
    final deals = await _loadDeals();

    return deals.where((deal) => deal.isFeatured).toList();
  }

  @override
  Future<List<Deal>> getPopularDeals() async {
    final deals = await _loadDeals();

    return deals.where((deal) => deal.isPopular).toList();
  }

  @override
  Future<List<Deal>> getUpcomingDeals() async {
    final deals = await _loadDeals();

    return deals.where((deal) => deal.isUpcoming).toList();
  }

  @override
  Future<List<Deal>> searchDeals(String query) async {
    final deals = await _loadDeals();
    final lowerQuery = query.toLowerCase();

    return deals
        .where((deal) =>
            deal.title.toLowerCase().contains(lowerQuery) ||
            deal.description.toLowerCase().contains(lowerQuery))
        .toList();
  }

  @override
  Future<Deal> getDealByID(String id) async {
    final deals = await _loadDeals();

    return deals.firstWhere(
      (deal) => deal.id == id,
      orElse: () => throw Exception('Deal not found'),
    );
  }

  @override
  Future<List<Deal>> getDealsByPage({int limit = 10, int offset = 0}) async {
    final deals = await _loadDeals();

    if (offset >= deals.length) {
      return [];
    }

    final end = (offset + limit > deals.length) ? deals.length : offset + limit;
    return deals.sublist(offset, end);
  }

  @override
  Future<List<Deal>> getDealsByIds(List<String> ids) async {
    final deals = await _loadDeals();
    return deals
        .where(
          (deal) => ids.contains(deal.id),
        )
        .toList();
  }
}
