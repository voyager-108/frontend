// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_page_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetHousePageIsarCollection on Isar {
  IsarCollection<HousePageIsar> get housePageIsars => this.collection();
}

const HousePageIsarSchema = CollectionSchema(
  name: r'HousePageIsar',
  id: 3375413537162415910,
  properties: {
    r'buildingCovered': PropertySchema(
      id: 0,
      name: r'buildingCovered',
      type: IsarType.bool,
    ),
    r'buildingName': PropertySchema(
      id: 1,
      name: r'buildingName',
      type: IsarType.string,
    ),
    r'flat': PropertySchema(
      id: 2,
      name: r'flat',
      type: IsarType.long,
    ),
    r'flatsLeft': PropertySchema(
      id: 3,
      name: r'flatsLeft',
      type: IsarType.long,
    ),
    r'floor': PropertySchema(
      id: 4,
      name: r'floor',
      type: IsarType.long,
    ),
    r'floorIndex': PropertySchema(
      id: 5,
      name: r'floorIndex',
      type: IsarType.long,
    ),
    r'floorsFlats': PropertySchema(
      id: 6,
      name: r'floorsFlats',
      type: IsarType.stringList,
    ),
    r'hasNoProgress': PropertySchema(
      id: 7,
      name: r'hasNoProgress',
      type: IsarType.bool,
    ),
    r'pk': PropertySchema(
      id: 8,
      name: r'pk',
      type: IsarType.long,
    ),
    r'progress': PropertySchema(
      id: 9,
      name: r'progress',
      type: IsarType.stringList,
    ),
    r'sectionNumber': PropertySchema(
      id: 10,
      name: r'sectionNumber',
      type: IsarType.long,
    ),
    r'sid': PropertySchema(
      id: 11,
      name: r'sid',
      type: IsarType.long,
    ),
    r'slug': PropertySchema(
      id: 12,
      name: r'slug',
      type: IsarType.string,
    )
  },
  estimateSize: _housePageIsarEstimateSize,
  serialize: _housePageIsarSerialize,
  deserialize: _housePageIsarDeserialize,
  deserializeProp: _housePageIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _housePageIsarGetId,
  getLinks: _housePageIsarGetLinks,
  attach: _housePageIsarAttach,
  version: '3.1.0+1',
);

int _housePageIsarEstimateSize(
  HousePageIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.buildingName.length * 3;
  bytesCount += 3 + object.floorsFlats.length * 3;
  {
    for (var i = 0; i < object.floorsFlats.length; i++) {
      final value = object.floorsFlats[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.progress.length * 3;
  {
    for (var i = 0; i < object.progress.length; i++) {
      final value = object.progress[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.slug.length * 3;
  return bytesCount;
}

void _housePageIsarSerialize(
  HousePageIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.buildingCovered);
  writer.writeString(offsets[1], object.buildingName);
  writer.writeLong(offsets[2], object.flat);
  writer.writeLong(offsets[3], object.flatsLeft);
  writer.writeLong(offsets[4], object.floor);
  writer.writeLong(offsets[5], object.floorIndex);
  writer.writeStringList(offsets[6], object.floorsFlats);
  writer.writeBool(offsets[7], object.hasNoProgress);
  writer.writeLong(offsets[8], object.pk);
  writer.writeStringList(offsets[9], object.progress);
  writer.writeLong(offsets[10], object.sectionNumber);
  writer.writeLong(offsets[11], object.sid);
  writer.writeString(offsets[12], object.slug);
}

HousePageIsar _housePageIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = HousePageIsar();
  object.buildingCovered = reader.readBool(offsets[0]);
  object.buildingName = reader.readString(offsets[1]);
  object.flat = reader.readLong(offsets[2]);
  object.flatsLeft = reader.readLong(offsets[3]);
  object.floor = reader.readLong(offsets[4]);
  object.floorIndex = reader.readLong(offsets[5]);
  object.floorsFlats = reader.readStringList(offsets[6]) ?? [];
  object.hasNoProgress = reader.readBool(offsets[7]);
  object.id = id;
  object.pk = reader.readLong(offsets[8]);
  object.progress = reader.readStringList(offsets[9]) ?? [];
  object.sectionNumber = reader.readLong(offsets[10]);
  object.sid = reader.readLong(offsets[11]);
  object.slug = reader.readString(offsets[12]);
  return object;
}

P _housePageIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readBool(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readStringList(offset) ?? []) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _housePageIsarGetId(HousePageIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _housePageIsarGetLinks(HousePageIsar object) {
  return [];
}

void _housePageIsarAttach(
    IsarCollection<dynamic> col, Id id, HousePageIsar object) {
  object.id = id;
}

extension HousePageIsarQueryWhereSort
    on QueryBuilder<HousePageIsar, HousePageIsar, QWhere> {
  QueryBuilder<HousePageIsar, HousePageIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension HousePageIsarQueryWhere
    on QueryBuilder<HousePageIsar, HousePageIsar, QWhereClause> {
  QueryBuilder<HousePageIsar, HousePageIsar, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension HousePageIsarQueryFilter
    on QueryBuilder<HousePageIsar, HousePageIsar, QFilterCondition> {
  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingCoveredEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingCovered',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'buildingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'buildingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'buildingName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'buildingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'buildingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'buildingName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'buildingName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'buildingName',
        value: '',
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      buildingNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'buildingName',
        value: '',
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> flatEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flat',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      flatGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flat',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      flatLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flat',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> flatBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      flatsLeftEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'flatsLeft',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      flatsLeftGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'flatsLeft',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      flatsLeftLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'flatsLeft',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      flatsLeftBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'flatsLeft',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorIndexEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorIndexGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorIndexLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorIndex',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorIndexBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorIndex',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorsFlats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floorsFlats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floorsFlats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floorsFlats',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'floorsFlats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'floorsFlats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'floorsFlats',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'floorsFlats',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floorsFlats',
        value: '',
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'floorsFlats',
        value: '',
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'floorsFlats',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'floorsFlats',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'floorsFlats',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'floorsFlats',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'floorsFlats',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      floorsFlatsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'floorsFlats',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      hasNoProgressEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasNoProgress',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> pkEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      pkGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> pkLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pk',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> pkBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pk',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'progress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'progress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'progress',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'progress',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progress',
        value: '',
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'progress',
        value: '',
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progress',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progress',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progress',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progress',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progress',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      progressLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'progress',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      sectionNumberEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sectionNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      sectionNumberGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sectionNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      sectionNumberLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sectionNumber',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      sectionNumberBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sectionNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> sidEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      sidGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> sidLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'sid',
        value: value,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> sidBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'sid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> slugEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      slugGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      slugLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> slugBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'slug',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      slugStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      slugEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      slugContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'slug',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition> slugMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'slug',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      slugIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'slug',
        value: '',
      ));
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterFilterCondition>
      slugIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'slug',
        value: '',
      ));
    });
  }
}

extension HousePageIsarQueryObject
    on QueryBuilder<HousePageIsar, HousePageIsar, QFilterCondition> {}

extension HousePageIsarQueryLinks
    on QueryBuilder<HousePageIsar, HousePageIsar, QFilterCondition> {}

extension HousePageIsarQuerySortBy
    on QueryBuilder<HousePageIsar, HousePageIsar, QSortBy> {
  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortByBuildingCovered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingCovered', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortByBuildingCoveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingCovered', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortByBuildingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingName', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortByBuildingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingName', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortByFlat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flat', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortByFlatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flat', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortByFlatsLeft() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flatsLeft', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortByFlatsLeftDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flatsLeft', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortByFloor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floor', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortByFloorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floor', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortByFloorIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorIndex', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortByFloorIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorIndex', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortByHasNoProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasNoProgress', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortByHasNoProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasNoProgress', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortBySectionNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionNumber', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      sortBySectionNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionNumber', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortBySid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortBySidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortBySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> sortBySlugDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.desc);
    });
  }
}

extension HousePageIsarQuerySortThenBy
    on QueryBuilder<HousePageIsar, HousePageIsar, QSortThenBy> {
  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenByBuildingCovered() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingCovered', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenByBuildingCoveredDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingCovered', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenByBuildingName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingName', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenByBuildingNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'buildingName', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByFlat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flat', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByFlatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flat', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByFlatsLeft() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flatsLeft', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenByFlatsLeftDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'flatsLeft', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByFloor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floor', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByFloorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floor', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByFloorIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorIndex', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenByFloorIndexDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'floorIndex', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenByHasNoProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasNoProgress', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenByHasNoProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasNoProgress', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenByPkDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pk', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenBySectionNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionNumber', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy>
      thenBySectionNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sectionNumber', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenBySid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenBySidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'sid', Sort.desc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenBySlug() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.asc);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QAfterSortBy> thenBySlugDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'slug', Sort.desc);
    });
  }
}

extension HousePageIsarQueryWhereDistinct
    on QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> {
  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct>
      distinctByBuildingCovered() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buildingCovered');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctByBuildingName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'buildingName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctByFlat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flat');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctByFlatsLeft() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'flatsLeft');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctByFloor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floor');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctByFloorIndex() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorIndex');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct>
      distinctByFloorsFlats() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'floorsFlats');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct>
      distinctByHasNoProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasNoProgress');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctByPk() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pk');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct>
      distinctBySectionNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sectionNumber');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctBySid() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'sid');
    });
  }

  QueryBuilder<HousePageIsar, HousePageIsar, QDistinct> distinctBySlug(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'slug', caseSensitive: caseSensitive);
    });
  }
}

extension HousePageIsarQueryProperty
    on QueryBuilder<HousePageIsar, HousePageIsar, QQueryProperty> {
  QueryBuilder<HousePageIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<HousePageIsar, bool, QQueryOperations>
      buildingCoveredProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buildingCovered');
    });
  }

  QueryBuilder<HousePageIsar, String, QQueryOperations> buildingNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'buildingName');
    });
  }

  QueryBuilder<HousePageIsar, int, QQueryOperations> flatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flat');
    });
  }

  QueryBuilder<HousePageIsar, int, QQueryOperations> flatsLeftProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'flatsLeft');
    });
  }

  QueryBuilder<HousePageIsar, int, QQueryOperations> floorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floor');
    });
  }

  QueryBuilder<HousePageIsar, int, QQueryOperations> floorIndexProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorIndex');
    });
  }

  QueryBuilder<HousePageIsar, List<String>, QQueryOperations>
      floorsFlatsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'floorsFlats');
    });
  }

  QueryBuilder<HousePageIsar, bool, QQueryOperations> hasNoProgressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasNoProgress');
    });
  }

  QueryBuilder<HousePageIsar, int, QQueryOperations> pkProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pk');
    });
  }

  QueryBuilder<HousePageIsar, List<String>, QQueryOperations>
      progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<HousePageIsar, int, QQueryOperations> sectionNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sectionNumber');
    });
  }

  QueryBuilder<HousePageIsar, int, QQueryOperations> sidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'sid');
    });
  }

  QueryBuilder<HousePageIsar, String, QQueryOperations> slugProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'slug');
    });
  }
}
