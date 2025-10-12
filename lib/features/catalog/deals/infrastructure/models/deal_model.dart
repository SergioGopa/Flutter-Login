import 'package:eisty/features/catalog/deals/domain/domain.dart';

class DealModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String type; // Food, Drinks, Dessert, etc.
  final DateTime validFrom;
  final DateTime validUntil;

  final String restaurantId;
  final String restaurantName;
  final double originalPrice;
  final double discountedPrice;

  // Categorization / Filtering
  final bool isFeatured; // carousel
  final bool isPopular; // popular deals
  final bool isUpcoming; // validFrom in the future
  final List<String> categories; // for category filter e.g. ["Mexican", "2x1"]
  final List<String> tags;

  // Ratings & Reviews
  final double rating; // average rating
  final int reviewsCount; // number of reviews

  //Filter related fields
  final List<String> validDaysOfWeek;
  final List<Map<String, String>> timeWindows;
  final double minOrderAmount;
  final bool dineInOnly;
  final bool delivery;
  final bool takeout;
  final bool adultsOnly;
  final bool petFriendly;

  DealModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl,
      required this.type,
      required this.validFrom,
      required this.validUntil,
      required this.restaurantId,
      required this.restaurantName,
      required this.originalPrice,
      required this.discountedPrice,
      this.isFeatured = false,
      this.isPopular = false,
      this.isUpcoming = false,
      this.categories = const [],
      this.tags = const [],
      this.rating = 0.0,
      this.reviewsCount = 0,
      this.validDaysOfWeek = const [],
      this.timeWindows = const [],
      this.minOrderAmount = 0.0,
      this.dineInOnly = false,
      this.delivery = false,
      this.takeout = false,
      this.adultsOnly = false,
      this.petFriendly = false});

  factory DealModel.fromJson(Map<String, dynamic> json) => DealModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        type: json['type'],
        validFrom: DateTime.parse(json['validFrom']),
        validUntil: DateTime.parse(json['validUntil']),
        restaurantId: json['restaurantId'],
        restaurantName: json['restaurantName'],
        originalPrice: (json['originalPrice'] as num).toDouble(),
        discountedPrice: (json['discountedPrice'] as num).toDouble(),
        isFeatured: json['isFeatured'] ?? false,
        isPopular: json['isPopular'] ?? false,
        isUpcoming: json['isUpcoming'] ?? false,
        categories: List<String>.from(json['categories'] ?? []),
        tags: List<String>.from(json['tags'] ?? []),
        rating: (json['rating'] ?? 0).toDouble(),
        reviewsCount: json['reviewsCount'] ?? 0,
        validDaysOfWeek: List<String>.from(json['validDaysOfWeek'] ?? []),
        timeWindows:   (json['timeWindows'] as List<dynamic>)
        ?.map((c)=> Map<String, String>.from(c as Map)).toList() ?? [],
        minOrderAmount: (json['minOrderAmount'] ?? 0).toDouble(),
        dineInOnly: json['dineInOnly'] ?? false,
        delivery: json['delivery'] ?? false,
        takeout: json['takeout'] ?? false,
        adultsOnly: json['adultsOnly'] ?? false,
        petFriendly: json['petFriendly'] ?? false,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'imageUrl': imageUrl,
        'type': type,
        'validFrom': validFrom.toIso8601String(),
        'validUntil': validUntil.toIso8601String(),
        'restaurantId': restaurantId,
        'restaurantName': restaurantName,
        'originalPrice': originalPrice,
        'discountedPrice': discountedPrice,
        'isFeatured': isFeatured,
        'isPopular': isPopular,
        'isUpcoming': isUpcoming,
        'categories': categories,
        'tags': tags,
        'rating': rating,
        'reviewsCount': reviewsCount,
        'validDaysOfWeek': validDaysOfWeek,
        'timeWindows': timeWindows,
        'minOrderAmount': minOrderAmount,
        'dineInOnly': dineInOnly,
        'delivery': delivery,
        'takeout': takeout,
        'adultsOnly': adultsOnly,
        'petFriendly': petFriendly,
      };

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
        timeWindows: timeWindows,
        minOrderAmount: minOrderAmount,
        dineInOnly: dineInOnly,
        delivery: delivery,
        takeout: takeout,
        adultsOnly: adultsOnly,
        petFriendly: petFriendly,
      );
}
