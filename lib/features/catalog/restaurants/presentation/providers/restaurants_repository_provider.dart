
import 'package:eisty/features/catalog/restaurants/domain/domain.dart';
import 'package:eisty/features/catalog/restaurants/infrastructure/infrastructure.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantsRepositoryProvider = Provider<RestaurantsRepository>(
  (ref) {
    final datasource = RestaurantsDatasourceImpl();
    final restaurantsRepository = RestaurantsRepositoryImpl(datasource);
    return restaurantsRepository;
  },
);
