import 'dart:core';

import 'package:frontend/camera/presentation/house_page_state.dart';
import 'package:frontend/models/house_progress_model.dart';
import 'package:isar/isar.dart';

import '../core/presentation/progress_video_state.dart';
import '../models/house_model.dart';

part 'house_page_isar.g.dart';

@collection
class HousePageIsar {
  // HouseModel
  Id id;
  // the format is "floor|flat", thus 2|3
  List<String> floorsFlats = [];
  int floorIndex = 0;
  bool buildingCovered = false;
  bool hasNoProgress = true;
  int floor = 0;
  int flat = 0;
  int flatsLeft = 0;
  int pk = -1;
  int sid = -1;
  String slug = "";
  String buildingName = "";
  int sectionNumber = -1;

  // HouseProgress
  // the format is "floor|flat|status|statusState"
  List<String> progress = [];

  HousePageIsar() : id = Isar.autoIncrement;

  HousePageIsar.fromHousePageState(HousePageState state) : id = state.id {
    floorsFlats = state.house
        .getFloorsFlats()
        .map((e) => "${e.floorNumber}|${e.flatsAmount}")
        .toList();
    floorIndex = state.house.getFloorIndex();
    buildingCovered = state.house.buildingCovered;
    hasNoProgress = state.house.hasNoProgress;
    floor = state.house.floor;
    flat = state.house.flat;
    flatsLeft = state.house.flatsLeft;
    pk = state.house.pk;
    sid = state.house.sid;
    slug = state.house.slug;
    buildingName = state.house.buildingName;
    sectionNumber = state.house.sectionNumber;
    progress = state.progress.progress
        .map((e) =>
            "${e.floorNumber}|${e.flatNumber}|${e.status}|${e.statusState.toString()}")
        .toList();
  }

  List<FloorModel> _parseFloorsFlats() => floorsFlats.map((e) {
        final v = e.split("|");
        return FloorModel(int.parse(v[0]), int.parse(v[1]));
      }).toList();

  HouseProgressModel _parseHouseProgress() =>
      HouseProgressModel.restore(progress.map((e) {
        final v = e.split("|");
        return FloorProgressModel.restore(int.parse(v[0]), int.parse(v[1]),
            v[2], ProcessedVideoState.parse(v[3]));
      }).toList());

  HousePageState parseHousePageState() => HousePageState(
      HouseModel.restore(
          pk,
          sid,
          slug,
          buildingName,
          sectionNumber,
          _parseFloorsFlats(),
          floor,
          flat,
          flatsLeft,
          hasNoProgress,
          buildingCovered,
          floorIndex),
      _parseHouseProgress(),
      id);
}
