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
}
