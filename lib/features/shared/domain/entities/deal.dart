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
  final bool isFeatured;       // carousel
  final bool isPopular;        // popular deals
  final bool isUpcoming;       // validFrom in the future
  final List<String> categories; // for category filter e.g. ["Mexican", "2x1"]

  // Ratings & Reviews
  final double rating;         // average rating
  final int reviewsCount;      // number of reviews

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

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
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
}
