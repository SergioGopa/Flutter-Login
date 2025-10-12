// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'deal_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDealEntityCollection on Isar {
  IsarCollection<DealEntity> get dealEntitys => this.collection();
}

const DealEntitySchema = CollectionSchema(
  name: r'DealEntity',
  id: -5119226446745691332,
  properties: {
    r'adultsOnly': PropertySchema(
      id: 0,
      name: r'adultsOnly',
      type: IsarType.bool,
    ),
    r'categories': PropertySchema(
      id: 1,
      name: r'categories',
      type: IsarType.stringList,
    ),
    r'delivery': PropertySchema(
      id: 2,
      name: r'delivery',
      type: IsarType.bool,
    ),
    r'description': PropertySchema(
      id: 3,
      name: r'description',
      type: IsarType.string,
    ),
    r'dineInOnly': PropertySchema(
      id: 4,
      name: r'dineInOnly',
      type: IsarType.bool,
    ),
    r'discountedPrice': PropertySchema(
      id: 5,
      name: r'discountedPrice',
      type: IsarType.double,
    ),
    r'id': PropertySchema(
      id: 6,
      name: r'id',
      type: IsarType.string,
    ),
    r'imageUrl': PropertySchema(
      id: 7,
      name: r'imageUrl',
      type: IsarType.string,
    ),
    r'isFeatured': PropertySchema(
      id: 8,
      name: r'isFeatured',
      type: IsarType.bool,
    ),
    r'isPopular': PropertySchema(
      id: 9,
      name: r'isPopular',
      type: IsarType.bool,
    ),
    r'isUpcoming': PropertySchema(
      id: 10,
      name: r'isUpcoming',
      type: IsarType.bool,
    ),
    r'minOrderAmount': PropertySchema(
      id: 11,
      name: r'minOrderAmount',
      type: IsarType.double,
    ),
    r'originalPrice': PropertySchema(
      id: 12,
      name: r'originalPrice',
      type: IsarType.double,
    ),
    r'petFriendly': PropertySchema(
      id: 13,
      name: r'petFriendly',
      type: IsarType.bool,
    ),
    r'rating': PropertySchema(
      id: 14,
      name: r'rating',
      type: IsarType.double,
    ),
    r'restaurantId': PropertySchema(
      id: 15,
      name: r'restaurantId',
      type: IsarType.string,
    ),
    r'restaurantName': PropertySchema(
      id: 16,
      name: r'restaurantName',
      type: IsarType.string,
    ),
    r'reviewsCount': PropertySchema(
      id: 17,
      name: r'reviewsCount',
      type: IsarType.long,
    ),
    r'tags': PropertySchema(
      id: 18,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'takeout': PropertySchema(
      id: 19,
      name: r'takeout',
      type: IsarType.bool,
    ),
    r'timeWindowsJson': PropertySchema(
      id: 20,
      name: r'timeWindowsJson',
      type: IsarType.string,
    ),
    r'title': PropertySchema(
      id: 21,
      name: r'title',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 22,
      name: r'type',
      type: IsarType.string,
    ),
    r'validDaysOfWeek': PropertySchema(
      id: 23,
      name: r'validDaysOfWeek',
      type: IsarType.stringList,
    ),
    r'validFrom': PropertySchema(
      id: 24,
      name: r'validFrom',
      type: IsarType.dateTime,
    ),
    r'validUntil': PropertySchema(
      id: 25,
      name: r'validUntil',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _dealEntityEstimateSize,
  serialize: _dealEntitySerialize,
  deserialize: _dealEntityDeserialize,
  deserializeProp: _dealEntityDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dealEntityGetId,
  getLinks: _dealEntityGetLinks,
  attach: _dealEntityAttach,
  version: '3.1.0+1',
);

int _dealEntityEstimateSize(
  DealEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categories.length * 3;
  {
    for (var i = 0; i < object.categories.length; i++) {
      final value = object.categories[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.description.length * 3;
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.imageUrl.length * 3;
  bytesCount += 3 + object.restaurantId.length * 3;
  bytesCount += 3 + object.restaurantName.length * 3;
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  {
    final value = object.timeWindowsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.title.length * 3;
  bytesCount += 3 + object.type.length * 3;
  bytesCount += 3 + object.validDaysOfWeek.length * 3;
  {
    for (var i = 0; i < object.validDaysOfWeek.length; i++) {
      final value = object.validDaysOfWeek[i];
      bytesCount += value.length * 3;
    }
  }
  return bytesCount;
}

void _dealEntitySerialize(
  DealEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.adultsOnly);
  writer.writeStringList(offsets[1], object.categories);
  writer.writeBool(offsets[2], object.delivery);
  writer.writeString(offsets[3], object.description);
  writer.writeBool(offsets[4], object.dineInOnly);
  writer.writeDouble(offsets[5], object.discountedPrice);
  writer.writeString(offsets[6], object.id);
  writer.writeString(offsets[7], object.imageUrl);
  writer.writeBool(offsets[8], object.isFeatured);
  writer.writeBool(offsets[9], object.isPopular);
  writer.writeBool(offsets[10], object.isUpcoming);
  writer.writeDouble(offsets[11], object.minOrderAmount);
  writer.writeDouble(offsets[12], object.originalPrice);
  writer.writeBool(offsets[13], object.petFriendly);
  writer.writeDouble(offsets[14], object.rating);
  writer.writeString(offsets[15], object.restaurantId);
  writer.writeString(offsets[16], object.restaurantName);
  writer.writeLong(offsets[17], object.reviewsCount);
  writer.writeStringList(offsets[18], object.tags);
  writer.writeBool(offsets[19], object.takeout);
  writer.writeString(offsets[20], object.timeWindowsJson);
  writer.writeString(offsets[21], object.title);
  writer.writeString(offsets[22], object.type);
  writer.writeStringList(offsets[23], object.validDaysOfWeek);
  writer.writeDateTime(offsets[24], object.validFrom);
  writer.writeDateTime(offsets[25], object.validUntil);
}

DealEntity _dealEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DealEntity();
  object.adultsOnly = reader.readBool(offsets[0]);
  object.categories = reader.readStringList(offsets[1]) ?? [];
  object.delivery = reader.readBool(offsets[2]);
  object.description = reader.readString(offsets[3]);
  object.dineInOnly = reader.readBool(offsets[4]);
  object.discountedPrice = reader.readDouble(offsets[5]);
  object.id = reader.readString(offsets[6]);
  object.imageUrl = reader.readString(offsets[7]);
  object.isFeatured = reader.readBool(offsets[8]);
  object.isPopular = reader.readBool(offsets[9]);
  object.isUpcoming = reader.readBool(offsets[10]);
  object.isarId = id;
  object.minOrderAmount = reader.readDouble(offsets[11]);
  object.originalPrice = reader.readDouble(offsets[12]);
  object.petFriendly = reader.readBool(offsets[13]);
  object.rating = reader.readDouble(offsets[14]);
  object.restaurantId = reader.readString(offsets[15]);
  object.restaurantName = reader.readString(offsets[16]);
  object.reviewsCount = reader.readLong(offsets[17]);
  object.tags = reader.readStringList(offsets[18]) ?? [];
  object.takeout = reader.readBool(offsets[19]);
  object.timeWindowsJson = reader.readStringOrNull(offsets[20]);
  object.title = reader.readString(offsets[21]);
  object.type = reader.readString(offsets[22]);
  object.validDaysOfWeek = reader.readStringList(offsets[23]) ?? [];
  object.validFrom = reader.readDateTime(offsets[24]);
  object.validUntil = reader.readDateTime(offsets[25]);
  return object;
}

P _dealEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readDouble(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readBool(offset)) as P;
    case 10:
      return (reader.readBool(offset)) as P;
    case 11:
      return (reader.readDouble(offset)) as P;
    case 12:
      return (reader.readDouble(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readDouble(offset)) as P;
    case 15:
      return (reader.readString(offset)) as P;
    case 16:
      return (reader.readString(offset)) as P;
    case 17:
      return (reader.readLong(offset)) as P;
    case 18:
      return (reader.readStringList(offset) ?? []) as P;
    case 19:
      return (reader.readBool(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readString(offset)) as P;
    case 22:
      return (reader.readString(offset)) as P;
    case 23:
      return (reader.readStringList(offset) ?? []) as P;
    case 24:
      return (reader.readDateTime(offset)) as P;
    case 25:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dealEntityGetId(DealEntity object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _dealEntityGetLinks(DealEntity object) {
  return [];
}

void _dealEntityAttach(IsarCollection<dynamic> col, Id id, DealEntity object) {
  object.isarId = id;
}

extension DealEntityQueryWhereSort
    on QueryBuilder<DealEntity, DealEntity, QWhere> {
  QueryBuilder<DealEntity, DealEntity, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DealEntityQueryWhere
    on QueryBuilder<DealEntity, DealEntity, QWhereClause> {
  QueryBuilder<DealEntity, DealEntity, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterWhereClause> isarIdNotEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterWhereClause> isarIdGreaterThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DealEntityQueryFilter
    on QueryBuilder<DealEntity, DealEntity, QFilterCondition> {
  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> adultsOnlyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adultsOnly',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categories',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categories',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categories',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> deliveryEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'delivery',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'description',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'description',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'description',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'description',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> dineInOnlyEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dineInOnly',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      discountedPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'discountedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      discountedPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'discountedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      discountedPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'discountedPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      discountedPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'discountedPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> imageUrlEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      imageUrlGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> imageUrlLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> imageUrlBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imageUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      imageUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> imageUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> imageUrlContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imageUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> imageUrlMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imageUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      imageUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      imageUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imageUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> isFeaturedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isFeatured',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> isPopularEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isPopular',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> isUpcomingEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUpcoming',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> isarIdEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      minOrderAmountEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'minOrderAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      minOrderAmountGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'minOrderAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      minOrderAmountLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'minOrderAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      minOrderAmountBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'minOrderAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      originalPriceEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      originalPriceGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      originalPriceLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'originalPrice',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      originalPriceBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'originalPrice',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      petFriendlyEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'petFriendly',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> ratingEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> ratingGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> ratingLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rating',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> ratingBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rating',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restaurantId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'restaurantId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'restaurantId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restaurantId',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'restaurantId',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restaurantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'restaurantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'restaurantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'restaurantName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'restaurantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'restaurantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'restaurantName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'restaurantName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'restaurantName',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      restaurantNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'restaurantName',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      reviewsCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reviewsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      reviewsCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'reviewsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      reviewsCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'reviewsCount',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      reviewsCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'reviewsCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> takeoutEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'takeout',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'timeWindowsJson',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'timeWindowsJson',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeWindowsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timeWindowsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timeWindowsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timeWindowsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'timeWindowsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'timeWindowsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'timeWindowsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'timeWindowsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timeWindowsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      timeWindowsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'timeWindowsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'title',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'title',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'title',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> titleIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      titleIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'title',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validDaysOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validDaysOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validDaysOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validDaysOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'validDaysOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'validDaysOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'validDaysOfWeek',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'validDaysOfWeek',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validDaysOfWeek',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'validDaysOfWeek',
        value: '',
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'validDaysOfWeek',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'validDaysOfWeek',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'validDaysOfWeek',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'validDaysOfWeek',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'validDaysOfWeek',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validDaysOfWeekLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'validDaysOfWeek',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> validFromEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validFromGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> validFromLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validFrom',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> validFromBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validFrom',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> validUntilEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'validUntil',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validUntilGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'validUntil',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition>
      validUntilLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'validUntil',
        value: value,
      ));
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterFilterCondition> validUntilBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'validUntil',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DealEntityQueryObject
    on QueryBuilder<DealEntity, DealEntity, QFilterCondition> {}

extension DealEntityQueryLinks
    on QueryBuilder<DealEntity, DealEntity, QFilterCondition> {}

extension DealEntityQuerySortBy
    on QueryBuilder<DealEntity, DealEntity, QSortBy> {
  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByAdultsOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultsOnly', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByAdultsOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultsOnly', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByDelivery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'delivery', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByDeliveryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'delivery', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByDineInOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dineInOnly', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByDineInOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dineInOnly', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByDiscountedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountedPrice', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy>
      sortByDiscountedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountedPrice', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByIsFeatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFeatured', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByIsFeaturedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFeatured', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByIsPopular() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPopular', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByIsPopularDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPopular', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByIsUpcoming() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUpcoming', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByIsUpcomingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUpcoming', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByMinOrderAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minOrderAmount', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy>
      sortByMinOrderAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minOrderAmount', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByOriginalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByPetFriendly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petFriendly', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByPetFriendlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petFriendly', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByRestaurantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantId', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByRestaurantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantId', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByRestaurantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantName', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy>
      sortByRestaurantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantName', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByReviewsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewsCount', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByReviewsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewsCount', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByTakeout() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'takeout', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByTakeoutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'takeout', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByTimeWindowsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeWindowsJson', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy>
      sortByTimeWindowsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeWindowsJson', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByValidFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByValidUntil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validUntil', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> sortByValidUntilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validUntil', Sort.desc);
    });
  }
}

extension DealEntityQuerySortThenBy
    on QueryBuilder<DealEntity, DealEntity, QSortThenBy> {
  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByAdultsOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultsOnly', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByAdultsOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adultsOnly', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByDelivery() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'delivery', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByDeliveryDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'delivery', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByDineInOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dineInOnly', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByDineInOnlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dineInOnly', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByDiscountedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountedPrice', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy>
      thenByDiscountedPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'discountedPrice', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByImageUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByImageUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'imageUrl', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIsFeatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFeatured', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIsFeaturedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isFeatured', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIsPopular() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPopular', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIsPopularDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isPopular', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIsUpcoming() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUpcoming', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIsUpcomingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUpcoming', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByMinOrderAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minOrderAmount', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy>
      thenByMinOrderAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minOrderAmount', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByOriginalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'originalPrice', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByPetFriendly() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petFriendly', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByPetFriendlyDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'petFriendly', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByRatingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rating', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByRestaurantId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantId', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByRestaurantIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantId', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByRestaurantName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantName', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy>
      thenByRestaurantNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'restaurantName', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByReviewsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewsCount', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByReviewsCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reviewsCount', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByTakeout() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'takeout', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByTakeoutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'takeout', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByTimeWindowsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeWindowsJson', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy>
      thenByTimeWindowsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timeWindowsJson', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByTitle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByTitleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'title', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByValidFromDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validFrom', Sort.desc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByValidUntil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validUntil', Sort.asc);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QAfterSortBy> thenByValidUntilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'validUntil', Sort.desc);
    });
  }
}

extension DealEntityQueryWhereDistinct
    on QueryBuilder<DealEntity, DealEntity, QDistinct> {
  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByAdultsOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adultsOnly');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByCategories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categories');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByDelivery() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'delivery');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByDescription(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByDineInOnly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dineInOnly');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByDiscountedPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'discountedPrice');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByImageUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imageUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByIsFeatured() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isFeatured');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByIsPopular() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isPopular');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByIsUpcoming() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUpcoming');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByMinOrderAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minOrderAmount');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByOriginalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'originalPrice');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByPetFriendly() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'petFriendly');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByRating() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rating');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByRestaurantId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restaurantId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByRestaurantName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'restaurantName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByReviewsCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reviewsCount');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByTags() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tags');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByTakeout() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'takeout');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByTimeWindowsJson(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timeWindowsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByTitle(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'title', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByValidDaysOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validDaysOfWeek');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByValidFrom() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validFrom');
    });
  }

  QueryBuilder<DealEntity, DealEntity, QDistinct> distinctByValidUntil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'validUntil');
    });
  }
}

extension DealEntityQueryProperty
    on QueryBuilder<DealEntity, DealEntity, QQueryProperty> {
  QueryBuilder<DealEntity, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<DealEntity, bool, QQueryOperations> adultsOnlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adultsOnly');
    });
  }

  QueryBuilder<DealEntity, List<String>, QQueryOperations>
      categoriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categories');
    });
  }

  QueryBuilder<DealEntity, bool, QQueryOperations> deliveryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'delivery');
    });
  }

  QueryBuilder<DealEntity, String, QQueryOperations> descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<DealEntity, bool, QQueryOperations> dineInOnlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dineInOnly');
    });
  }

  QueryBuilder<DealEntity, double, QQueryOperations> discountedPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'discountedPrice');
    });
  }

  QueryBuilder<DealEntity, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DealEntity, String, QQueryOperations> imageUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imageUrl');
    });
  }

  QueryBuilder<DealEntity, bool, QQueryOperations> isFeaturedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isFeatured');
    });
  }

  QueryBuilder<DealEntity, bool, QQueryOperations> isPopularProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isPopular');
    });
  }

  QueryBuilder<DealEntity, bool, QQueryOperations> isUpcomingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUpcoming');
    });
  }

  QueryBuilder<DealEntity, double, QQueryOperations> minOrderAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minOrderAmount');
    });
  }

  QueryBuilder<DealEntity, double, QQueryOperations> originalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'originalPrice');
    });
  }

  QueryBuilder<DealEntity, bool, QQueryOperations> petFriendlyProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'petFriendly');
    });
  }

  QueryBuilder<DealEntity, double, QQueryOperations> ratingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rating');
    });
  }

  QueryBuilder<DealEntity, String, QQueryOperations> restaurantIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restaurantId');
    });
  }

  QueryBuilder<DealEntity, String, QQueryOperations> restaurantNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'restaurantName');
    });
  }

  QueryBuilder<DealEntity, int, QQueryOperations> reviewsCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reviewsCount');
    });
  }

  QueryBuilder<DealEntity, List<String>, QQueryOperations> tagsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tags');
    });
  }

  QueryBuilder<DealEntity, bool, QQueryOperations> takeoutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'takeout');
    });
  }

  QueryBuilder<DealEntity, String?, QQueryOperations>
      timeWindowsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timeWindowsJson');
    });
  }

  QueryBuilder<DealEntity, String, QQueryOperations> titleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'title');
    });
  }

  QueryBuilder<DealEntity, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }

  QueryBuilder<DealEntity, List<String>, QQueryOperations>
      validDaysOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validDaysOfWeek');
    });
  }

  QueryBuilder<DealEntity, DateTime, QQueryOperations> validFromProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validFrom');
    });
  }

  QueryBuilder<DealEntity, DateTime, QQueryOperations> validUntilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'validUntil');
    });
  }
}
