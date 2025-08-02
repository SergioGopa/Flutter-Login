import 'dart:convert';


import 'package:eisty/features/catalog/restaurants/domain/domain.dart';
import 'package:flutter/services.dart';

class RestaurantsDatasourceImpl extends RestaurantsDatasource {
  Future<List<Restaurant>> _loadRestaurants() async {
    final jsonString =
        await rootBundle.loadString('assets/mock/mock_restaurants.json');

    final List<dynamic> data = jsonDecode(jsonString);

    return data
        .map(
          (item) => Restaurant.fromJson(item),
        )
        .toList();
  }

  @override
  Future<List<Restaurant>> getNearbyRestaurants() async {
    final restaurants = await _loadRestaurants();

    return restaurants
        .where(
          (restaurant) => restaurant.isNearby,
        )
        .toList();
  }

  @override
  Future<List<Restaurant>> getTopRatedRestaurants() async {
    final restaurants = await _loadRestaurants();

    return restaurants
        .where(
          (restaurant) => restaurant.isTopRated,
        )
        .toList();
  }

  @override
  Future<List<Restaurant>> searchRestaurants(String query) async {
    final restaurants = await _loadRestaurants();
    final lowerQuery = query.toLowerCase();

    return restaurants
        .where(
          (restaurant) => restaurant.name.toLowerCase().contains(lowerQuery),
        )
        .toList();
  }

  @override
  Future<Restaurant> getRestaurantById(String id) async {
    final restaurants = await _loadRestaurants();

    return restaurants.firstWhere(
      (restaurant) => restaurant.id == id,
      orElse: () => throw Exception('Restaurant not found'),
    );
  }

  @override
  Future<List<Restaurant>> getRestaurantsByCategory(String category) async {
    final restaurants = await _loadRestaurants();

    return restaurants
        .where(
          (restaurant) => restaurant.categories.contains(category),
        )
        .toList();
  }

  @override
  Future<List<Restaurant>> getRestaurantsByPage(
      {int limit = 10, int offset = 0}) async {
    final restaurants = await _loadRestaurants();

    if (offset >= restaurants.length) {
      return [];
    }

    final end = (offset + limit > restaurants.length)
        ? restaurants.length
        : offset + limit;
    return restaurants.sublist(offset, end);
  }
}
