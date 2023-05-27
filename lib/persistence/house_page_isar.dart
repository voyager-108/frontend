import 'dart:core';

import 'package:frontend/camera/presentation/house_page_state.dart';
import 'package:frontend/models/house_progress_model.dart';
import 'package:isar/isar.dart';

import '../models/house_model.dart';

part 'house_page_isar.g.dart';

@collection
class HousePageIsar {
  // HouseModel
  Id id = Isar.autoIncrement;
  // the format is "floor|flat", thus 2|3
  final List<String> floorsFlats = [];
  int floorIndex = 0;
  bool buildingCovered = false;
  bool hasNoProgress = true;
  int floor = 0;
  int flat = 0;
  int flatsLeft = 0;

  // HouseProgress
  // the format is "floor|flat|status"
  List<String> progress = [];

  List<FloorModel> _parseFloorsFlats() => floorsFlats.map((e) {
        final v = e.split("|");
        return FloorModel(v[0] as int, v[1] as int);
      }).toList(growable: false);

  HouseProgressModel _parseHouseProgress() =>
      HouseProgressModel.restore(progress.map((e) {
        final v = e.split("|");
        return FloorProgressModel.restore(v[0] as int, v[1] as int, v[2], null);
      }).toList(growable: false));

  HousePageState parseHousePageState() {
    return HousePageState.withHouse(
        HouseModel.restore(_parseFloorsFlats(), floor, flat, flatsLeft,
            hasNoProgress, buildingCovered, floorIndex),
        _parseHouseProgress());
  }
}
