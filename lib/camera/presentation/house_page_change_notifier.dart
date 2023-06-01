import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/presentation/house_page_state.dart';

import '../../di.dart';
import '../../models/house_model.dart';
import '../../models/house_progress_model.dart';

class HousePageChangeNotifier extends ChangeNotifier {
  int? _index;
  final Ref _ref;
  HousePageChangeNotifier(this._ref);
  bool areFloorsFlatsSet = true;
  bool? isNew;

  HousePageState? _state() => _index == null
      ? null
      : _ref.read(DI.housePagesChangeNotifier).byIndex(_index!);

  HousePageState? getState() => _state();
  bool hasState() => _state() != null;

  void init(int newIndex, bool floorsFlatsSet, bool isNew) {
    _index = newIndex;
    areFloorsFlatsSet = floorsFlatsSet;
    this.isNew = isNew;
    notifyListeners();
  }

  bool? isRecording() {
    final s = _state();
    if (s == null) return null;
    return s.isRecording;
  }

  bool? hasNoProgress() {
    final s = _state();
    if (s == null) return null;
    return s.house.hasNoProgress;
  }

  bool? isBuildingCovered() {
    final s = _state();
    if (s == null) return null;
    return s.house.buildingCovered;
  }

  int? currentFloor() {
    final s = _state();
    if (s == null) return null;
    return s.house.floor;
  }

  int? currentFlat() {
    final s = _state();
    if (s == null) return null;
    return s.house.flat;
  }

  int? currentFlatsLeft() {
    final s = _state();
    if (s == null) return null;
    return s.house.flatsLeft;
  }

  int? progressLength() {
    final s = _state();
    if (s == null) return null;
    return s.progress.progress.length;
  }

  FloorProgressModel? progressElement(int index) {
    final s = _state();
    if (s == null) return null;
    return s.progress.progress[index];
  }

  void startRecording() {
    final s = _state();
    if (s == null) return;
    s.house.startFlatRecording();
    s.isRecording = true;
    notifyListeners();
  }

  void stopRecording() {
    final s = _state();
    if (s == null) return;
    s.house.endFlatRecording();
    s.isRecording = false;
    notifyListeners();
  }

  void setFloorsFlats(List<FloorModel> ff) {
    final s = _state();
    if (s == null) return;
    s.house.initFloorsFlats(ff);
    areFloorsFlatsSet = true;
    notifyListeners();
  }

  int? addProgress(FloorProgressModel newProgress) {
    final s = _state();
    if (s == null) return null;
    s.progress.progress.add(newProgress);
    notifyListeners();
    return s.progress.progress.length - 1;
  }

  void updateProgress(int pIndex, String? status) {
    final s = _state();
    if (s == null) return;
    if (status != null) {
      s.progress.progress[pIndex].status = status;
    }
    notifyListeners();
  }

  List<List<String?>> formProgressGrid() {
    final s = _state();
    if (s == null) return [[]];
    final floorsFlats = s.house.getFloorsFlats();
    final progressList = List.generate(floorsFlats.length,
        (i) => List<String?>.generate(floorsFlats[i].flatsAmount, (j) => null));
    final firstFloorNumber = floorsFlats[0].floorNumber;
    for (final p in s.progress.progress) {
      final floorIndex =
          progressList.length - 1 - (p.floorNumber - firstFloorNumber);
      progressList[floorIndex][p.flatNumber - 1] = p.status;
    }
    return progressList;
  }
}
