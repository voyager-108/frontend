class HouseModel {
  final List<FloorModel> _floorsFlats;
  int _floorIndex = 0;
  bool buildingCovered = false;
  int currentFloor;
  int currentFlatsLeft;

  HouseModel(this._floorsFlats)
      : currentFloor = _floorsFlats[0].floorNumber,
        currentFlatsLeft = _floorsFlats[0].flatsAmount;

  void nextFlat() {
    if (currentFlatsLeft == 0 && _floorIndex == _floorsFlats.length - 1) {
      // the building is fully covered
      buildingCovered = true;
    } else if (currentFlatsLeft == 0) {
      // all the flats on the current floor are covered,
      // move to the next floor
      _floorIndex += 1;
      currentFloor = _floorsFlats[_floorIndex].floorNumber;
      currentFlatsLeft = _floorsFlats[_floorIndex].flatsAmount;
    } else {
      // move to the next flat on the same floor
      currentFlatsLeft -= 1;
    }
  }
}

class FloorModel {
  int floorNumber;
  int flatsAmount;

  FloorModel(this.floorNumber, this.flatsAmount);
}
