import '../../models/house_model.dart';
import '../../models/progress_model.dart';

class CameraPageStates {
  HouseModel house;
  HouseProgressModel progress;
  int? currentlyRecordingFloor;

  CameraPageStates(this.house, this.progress);
}
