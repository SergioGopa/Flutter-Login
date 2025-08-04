import 'package:equatable/equatable.dart';

class DealDetails extends Equatable {
  final String id;
  final String title;
  final String description;
  final List<String> imageUrls;
  final double price;
  final double? originalPrice;
  final String? promoTag; // e.g. "20% Off", "2x1"
  final double rating; // average rating
  final int reviewsCount;
  final List<String> tags; // e.g. "#1 Most Liked", "Ordered before"
  final bool isPreviouslyOrdered;
  final List<OptionGroup> options; // for choose options like sizes, extras
  final List<Review> reviews; // list of reviews (short)
  final List<String> relatedDealIds; // for related items
  final List<String> frequentlyBoughtTogetherIds;
  final String restaurantId;
  final String? allergens;

  const DealDetails(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrls,
      required this.price,
      this.originalPrice,
      this.promoTag,
      required this.rating,
      required this.reviewsCount,
      required this.tags,
      this.isPreviouslyOrdered = false,
      this.options = const [],
      this.reviews = const [],
      this.relatedDealIds = const [],
      this.frequentlyBoughtTogetherIds = const [],
      required this.restaurantId,
      this.allergens});

  DealDetails copyWith({
    String? id,
    String? title,
    String? description,
    List<String>? imageUrls,
    double? price,
    double? originalPrice,
    String? promoTag,
    double? rating,
    int? reviewsCount,
    List<String>? tags,
    bool? isPreviouslyOrdered,
    List<OptionGroup>? options,
    List<Review>? reviews,
    List<String>? relatedDealIds,
    List<String>? frequentlyBoughtTogetherIds,
    String? restaurantId,
    String? allergens,
  }) {
    return DealDetails(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrls: imageUrls ?? this.imageUrls,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      promoTag: promoTag ?? this.promoTag,
      rating: rating ?? this.rating,
      reviewsCount: reviewsCount ?? this.reviewsCount,
      tags: tags ?? this.tags,
      isPreviouslyOrdered: isPreviouslyOrdered ?? this.isPreviouslyOrdered,
      options: options ?? this.options,
      reviews: reviews ?? this.reviews,
      relatedDealIds: relatedDealIds ?? this.relatedDealIds,
      frequentlyBoughtTogetherIds:
          frequentlyBoughtTogetherIds ?? this.frequentlyBoughtTogetherIds,
      restaurantId: restaurantId ?? this.restaurantId,
      allergens: allergens ?? this.allergens,
    );
  }

  factory DealDetails.fromJson(Map<String, dynamic> json) {
    return DealDetails(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      imageUrls: List<String>.from(json['imageUrls'] ?? []),
      price: (json['price'] as num).toDouble(),
      originalPrice: json['originalPrice'] != null
          ? (json['originalPrice'] as num).toDouble()
          : null,
      promoTag: json['promoTag'],
      rating: (json['rating'] as num).toDouble(),
      reviewsCount: json['reviewsCount'],
      tags: List<String>.from(json['tags'] ?? []),
      isPreviouslyOrdered: json['isPreviouslyOrdered'] ?? false,
      options: (json['options'] as List<dynamic>).map((e) => OptionGroup.fromJson(e)).toList(),
      reviews: (json['reviews'] as List<dynamic>).map((e) => Review.fromJson(e)).toList(),
      relatedDealIds: List<String>.from(json['relatedDealIds']),
      frequentlyBoughtTogetherIds:
          List<String>.from(json['frequentlyBoughtTogetherIds']),
      restaurantId: json['restaurantId'],
      allergens: json['allergens'] !=null ? json['allergens'].join(', '): null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrls': imageUrls,
      'price': price,
      'originalPrice': originalPrice,
      'promoTag': promoTag,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'tags': tags,
      'isPreviouslyOrdered': isPreviouslyOrdered,
      'options': options.map((e) => e.toJson()).toList(),
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'relatedDealIds': relatedDealIds,
      'frequentlyBoughtTogetherIds': frequentlyBoughtTogetherIds,
      'restaurantId': restaurantId,
      'allergens': allergens,
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrls,
        price,
        originalPrice,
        promoTag,
        rating,
        reviewsCount,
        tags,
        isPreviouslyOrdered,
        options,
        reviews,
        relatedDealIds,
        frequentlyBoughtTogetherIds,
        restaurantId,
        allergens
      ];
}

class OptionGroup extends Equatable {
  final String name;
  final bool isRequired;
  final List<OptionItem> items;

  const OptionGroup(
      {required this.name, required this.isRequired, required this.items});

  factory OptionGroup.fromJson(Map<String, dynamic> json) {
    return OptionGroup(
      name: json['title'],
      isRequired: json['isRequired'],
      items: (json['options'] as List<dynamic>)
          .map(
            (e) => OptionItem.fromJson(e),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'isRequired': isRequired,
    'items': items.map((e) => e.toJson(),).toList(),
  };

  @override
  List<Object?> get props => [name, isRequired, items];
}

class OptionItem extends Equatable {
  final String name;
  final double? price;

  const OptionItem({required this.name, this.price});

  factory OptionItem.fromJson(Map<String, dynamic> json) {
    return OptionItem(
      name: json['name'],
      price: json['priceMofifier']?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'price': price,
      };

  @override
  List<Object?> get props => [name, price];
}

class Review extends Equatable {
  final String user;
  final String comment;
  final double rating;

  const Review(
      {required this.user, required this.comment, required this.rating});

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      user: json['user'],
      comment: json['comment'],
      rating: (json['rating'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'user': user,
        'comment': comment,
        'rating': rating,
      };

  @override
  List<Object?> get props => [user, comment, rating];
}
