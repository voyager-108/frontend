import 'package:flutter/cupertino.dart';
import 'package:frontend/camera/presentation/house_page_state.dart';

import '../../models/house_model.dart';
import '../../models/house_progress_model.dart';

class HousePageChangeNotifier extends ChangeNotifier {
  HousePageState _state = HousePageState.withHouse(
      HouseModel.withFlat([
        FloorModel(1, 4),
        FloorModel(2, 3),
      ], -1, -1, "", "", -1),
      HouseProgressModel());

  HousePageState getState() => _state;

  bool areFloorsFlatsSet = true;
  bool isRecording() => _state.isRecording;
  bool hasNoProgress() => _state.house.hasNoProgress;
  bool isBuildingCovered() => _state.house.buildingCovered;
  int currentFloor() => _state.house.floor;
  int currentFlat() => _state.house.flat;
  int currentFlatsLeft() => _state.house.flatsLeft;
  int progressLength() => _state.progress.progress.length;
  FloorProgressModel progressElement(int index) =>
      _state.progress.progress[index];

  void startRecording() {
    _state.house.startFlatRecording();
    _state.isRecording = true;
    notifyListeners();
  }

  void stopRecording() {
    _state.house.endFlatRecording();
    _state.isRecording = false;
    notifyListeners();
  }

  void setFloorsFlats(List<FloorModel> ff) {
    _state.house.initFloorsFlats(ff);
    areFloorsFlatsSet = true;
    notifyListeners();
  }

  int addProgress(FloorProgressModel newProgress) {
    _state.progress.progress.add(newProgress);
    notifyListeners();
    return _state.progress.progress.length - 1;
  }

  void updateProgress(int pIndex, [String? status]) {
    if (status != null) {
      _state.progress.progress[pIndex].status = status;
    }
    notifyListeners();
  }

  void init(HousePageState newState) {
    _state = newState;
    areFloorsFlatsSet = _state.house.getFloorsFlats().isEmpty;
    notifyListeners();
  }
}
