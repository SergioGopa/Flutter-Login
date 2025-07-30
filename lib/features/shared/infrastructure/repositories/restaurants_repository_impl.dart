import 'package:eisty/features/shared/domain/datasources/restaurants_datasource.dart';
import 'package:eisty/features/shared/domain/repositories/restaurants_repository.dart';

import '../../domain/domain.dart';

class RestaurantsRepositoryImpl extends RestaurantsRepository {
  final RestaurantsDatasource datasource;

  RestaurantsRepositoryImpl(this.datasource);
  @override
  Future<List<Restaurant>> getNearbyRestaurants() {
    return datasource.getNearbyRestaurants();
  }

  @override
  Future<List<Restaurant>> getTopRatedRestaurants() {
    return datasource.getTopRatedRestaurants();
  }

  @override
  Future<List<Restaurant>> searchRestaurants(String query) {
    return datasource.searchRestaurants(query);
  }

  @override
  Future<Restaurant> getRestaurantById(String id) {
    return datasource.getRestaurantById(id);
  }

  @override
  Future<List<Restaurant>> getRestaurantsByCategory(String category) {
    return datasource.getRestaurantsByCategory(category);
  }

  @override
  Future<List<Restaurant>> getRestaurantsByPage(
      {int limit = 10, int offset = 0}) {
    return datasource.getRestaurantsByPage(limit: limit, offset: offset);
  }
}
