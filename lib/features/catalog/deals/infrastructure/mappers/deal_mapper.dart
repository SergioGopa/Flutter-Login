import 'dart:convert';

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
    restaurantName: restaurantName,
    originalPrice: originalPrice,
    discountedPrice: discountedPrice,
    isFeatured: isFeatured,
    isPopular: isPopular,
    isUpcoming: isUpcoming,
    categories: categories,
    tags: tags,
    rating: rating,
    reviewsCount: reviewsCount,
    validDaysOfWeek: validDaysOfWeek,
    timeWindows: timeWindowsJson != null && timeWindowsJson!.isNotEmpty
            ? List<Map<String, String>>.from(jsonDecode(timeWindowsJson!))
            : [],
    minOrderAmount: minOrderAmount,
    dineInOnly: dineInOnly,
    delivery: delivery,
    takeout: takeout,
    adultsOnly: adultsOnly,
    petFriendly: petFriendly,
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
    ..restaurantName = restaurantName
    ..originalPrice = originalPrice
    ..discountedPrice = discountedPrice
    ..isFeatured = isFeatured
    ..isPopular = isPopular
    ..isUpcoming = isUpcoming
    ..categories = categories
    ..tags = tags
    ..rating = rating
    ..reviewsCount = reviewsCount
    ..validDaysOfWeek = validDaysOfWeek
    ..timeWindowsJson = jsonEncode(timeWindows)
    ..minOrderAmount = minOrderAmount
    ..dineInOnly = dineInOnly
    ..delivery = delivery
    ..takeout = takeout
    ..adultsOnly = adultsOnly
    ..petFriendly = petFriendly
    ;
}
