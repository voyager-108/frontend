import 'package:flutter/cupertino.dart';
import 'package:frontend/camera/presentation/camera_page_state.dart';

import '../../models/house_model.dart';
import '../../models/progress_model.dart';

class CameraPageChangeNotifier extends ChangeNotifier {
  final _state = CameraPageState(
      HouseModel([
        FloorModel(1, 12),
        FloorModel(2, 11),
        FloorModel(3, 13),
        FloorModel(4, 10),
      ]),
      HouseProgressModel());

  bool isRecording() => _state.currentlyRecordingFlat != null;
  int? currentlyRecordingFlat() => _state.currentlyRecordingFlat;
  int currentFloor() => _state.house.currentFloor;
  int currentFlat() => _state.house.currentFlat;
  int currentFlatsLeft() => _state.house.currentFlatsLeft;
  int progressLength() => _state.progress.progress.length;
  FloorProgressModel progressElement(int index) =>
      _state.progress.progress[index];

  void startRecording() {
    _state.currentlyRecordingFlat = _state.house.currentFlat;
    _state.house.nextFlat();
    notifyListeners();
  }

  void stopRecording() {
    _state.currentlyRecordingFlat = null;
    notifyListeners();
  }
}
