import '../../models/house_model.dart';
import '../../models/progress_model.dart';

class CameraPageState {
  HouseModel house;
  HouseProgressModel progress;
  int? currentlyRecordingFlat;

  CameraPageState(this.house, this.progress);
}
