import 'package:isar/isar.dart';

@embedded
class HouseModel {
  final List<FloorModel> _floorsFlats;
  int _floorIndex = 0;
  bool buildingCovered = false;
  bool hasNoProgress = true;
  int floor;
  int flat;
  int flatsLeft;

  HouseModel()
      : _floorsFlats = [],
        floor = 0,
        flat = 0,
        flatsLeft = 0;

  HouseModel.withFlat(this._floorsFlats)
      : floor = _floorsFlats[0].floorNumber,
        flat = 0,
        flatsLeft = _floorsFlats[0].flatsAmount;

  HouseModel.restore(this._floorsFlats, this.floor, this.flat, this.flatsLeft,
      this.hasNoProgress, this.buildingCovered, this._floorIndex);

  void startFlatRecording() {
    flat += 1;
    flatsLeft -= 1;
  }

  void endFlatRecording() {
    if (flatsLeft == 0 && _floorIndex == _floorsFlats.length - 1) {
      buildingCovered = true;
    } else if (flatsLeft == 0) {
      _floorIndex += 1;
      floor = _floorsFlats[_floorIndex].floorNumber;
      flat = 0;
      flatsLeft = _floorsFlats[_floorIndex].flatsAmount;
    }
    if (hasNoProgress) hasNoProgress = false;
  }
}

class FloorModel {
  int floorNumber;
  int flatsAmount;

  FloorModel(this.floorNumber, this.flatsAmount);
}
