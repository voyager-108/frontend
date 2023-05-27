import 'package:isar/isar.dart';

import '../../models/house_model.dart';
import '../../models/house_progress_model.dart';

class HousePageState {
  Id id = Isar.autoIncrement;
  HouseModel house;
  HouseProgressModel progress;
  bool isRecording = false;

  HousePageState.withHouse(this.house, this.progress);
  HousePageState()
      : house = HouseModel(),
        progress = HouseProgressModel();
}
