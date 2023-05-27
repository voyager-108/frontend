import 'package:isar/isar.dart';

@embedded
class FloorProgressModel {
  int floorNumber;
  int flatNumber;
  String? status;
  AdditionalInfoModel? info;

  FloorProgressModel()
      : floorNumber = 0,
        flatNumber = 0;
  FloorProgressModel.withFlat(this.floorNumber, this.flatNumber);
  FloorProgressModel.restore(
      this.floorNumber, this.flatNumber, this.status, this.info);
}

@embedded
class AdditionalInfoModel {}

@embedded
class HouseProgressModel {
  List<FloorProgressModel> progress;

  HouseProgressModel() : progress = [];
  HouseProgressModel.restore(this.progress);
}
