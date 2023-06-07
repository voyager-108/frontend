import 'package:isar/isar.dart';

import '../../models/house_model.dart';
import '../../models/house_progress_model.dart';

class HousePageState {
  Id id;
  HouseModel house;
  HouseProgressModel progress;
  bool isRecording = false;

  HousePageState(this.house, this.progress, [this.id = Isar.autoIncrement]);
}
