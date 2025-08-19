
class Deal {
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

  Deal({
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

  Deal copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    String? type,
    DateTime? validFrom,
    DateTime? validUntil,
    String? restaurantId,
    double? originalPrice,
    double? discountedPrice,
    bool? isFeatured,
    bool? isPopular,
    bool? isUpcoming,
    List<String>? categories,
    double? rating,
    int? reviewsCount,
  }) {
    return Deal(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      type: type ?? this.type,
      validFrom: validFrom ?? this.validFrom,
      validUntil: validUntil ?? this.validUntil,
      restaurantId: restaurantId ?? this.restaurantId,
      originalPrice: originalPrice ?? this.originalPrice,
      discountedPrice: discountedPrice ?? this.discountedPrice,
      isFeatured: isFeatured ?? this.isFeatured,
      isPopular: isPopular ?? this.isPopular,
      isUpcoming: isUpcoming ?? this.isUpcoming,
      categories: categories ?? this.categories,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
    );
  }

}
