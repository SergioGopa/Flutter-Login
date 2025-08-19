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
  final double originalPrice;
  final double discountedPrice;

  // Categorization / Filtering
  final bool isFeatured; // carousel
  final bool isPopular; // popular deals
  final bool isUpcoming; // validFrom in the future
  final List<String> categories; // for category filter e.g. ["Mexican", "2x1"]

  // Ratings & Reviews
  final double rating; // average rating
  final int reviewsCount; // number of reviews

  DealModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
    required this.validFrom,
    required this.validUntil,
    required this.restaurantId,
    required this.originalPrice,
    required this.discountedPrice,
    this.isFeatured = false,
    this.isPopular = false,
    this.isUpcoming = false,
    this.categories = const [],
    this.rating = 0.0,
    this.reviewsCount = 0,
  });

  factory DealModel.fromJson(Map<String, dynamic> json) => DealModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        imageUrl: json['imageUrl'],
        type: json['type'],
        validFrom: DateTime.parse(json['validFrom']),
        validUntil: DateTime.parse(json['validUntil']),
        restaurantId: json['restaurantId'],
        originalPrice: (json['originalPrice'] as num).toDouble(),
        discountedPrice: (json['discountedPrice'] as num).toDouble(),
        isFeatured: json['isFeatured'] ?? false,
        isPopular: json['isPopular'] ?? false,
        isUpcoming: json['isUpcoming'] ?? false,
        categories: List<String>.from(json['categories'] ?? []),
        rating: (json['rating'] ?? 0).toDouble(),
        reviewsCount: json['reviewsCount'] ?? 0,
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
        'originalPrice': originalPrice,
        'discountedPrice': discountedPrice,
        'isFeatured': isFeatured,
        'isPopular': isPopular,
        'isUpcoming': isUpcoming,
        'categories': categories,
        'rating': rating,
        'reviewsCount': reviewsCount,
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
