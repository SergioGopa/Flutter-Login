import 'package:eisty/features/catalog/deals/domain/domain.dart';
import 'package:eisty/features/catalog/deals/infrastructure/datasources/local/Isar/deal_entity.dart';

extension DealEntityMapper on DealEntity {
  Deal toEntity() => Deal(
    id: id,
    title: title,
    description: description,
    imageUrl: imageUrl,
    type: type,
    validFrom: validFrom,
    validUntil: validUntil,
    restaurantId: restaurantId,
    originalPrice: originalPrice,
    discountedPrice: discountedPrice,
    isFeatured: isFeatured,
    isPopular: isPopular,
    isUpcoming: isUpcoming,
    categories: categories,
    rating: rating,
    reviewsCount: reviewsCount,
  );
}

extension DealToEntityMapper on Deal {
  DealEntity toIsar() => DealEntity()
    ..id = id
    ..title = title
    ..description = description
    ..imageUrl = imageUrl
    ..type = type
    ..validFrom = validFrom
    ..validUntil = validUntil
    ..restaurantId = restaurantId
    ..originalPrice = originalPrice
    ..discountedPrice = discountedPrice
    ..isFeatured = isFeatured
    ..isPopular = isPopular
    ..isUpcoming = isUpcoming
    ..categories = categories
    ..rating = rating
    ..reviewsCount = reviewsCount;
}
