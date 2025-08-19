import 'package:isar/isar.dart';

part 'deal_entity.g.dart';

@collection
class DealEntity {
  Id isarId = Isar.autoIncrement;

  late String id;
  late String title;
  late String description;
  late String imageUrl;
  late String type;
  late DateTime validFrom;
  late DateTime validUntil;
  late String restaurantId;
  late double originalPrice;
  late double discountedPrice;

  bool isFeatured = false;
  bool isPopular = false;
  bool isUpcoming = false;
  List<String> categories = [];

  double rating = 0.0;
  int reviewsCount = 0;
}