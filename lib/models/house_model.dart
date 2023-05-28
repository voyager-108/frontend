class HouseModel {
  List<FloorModel> _floorsFlats = List.empty(growable: false);
  int _floorIndex = 0;
  bool buildingCovered = false;
  bool hasNoProgress = true;
  int floor = 0;
  int flat = 0;
  int flatsLeft = 1;

  // API data
  int pk = -1;
  int sid = -1;
  String slug = "";
  String buildingName = "";
  int sectionNumber = -1;

  HouseModel();

  HouseModel.withFlat(this._floorsFlats, this.pk, this.sid, this.slug,
      this.buildingName, this.sectionNumber)
      : floor = _floorsFlats[0].floorNumber,
        flat = 0,
        flatsLeft = _floorsFlats[0].flatsAmount;

  HouseModel.noFlat(
      this.pk, this.sid, this.slug, this.buildingName, this.sectionNumber);

  void initFloorsFlats(List<FloorModel> ff) {
    _floorsFlats = ff;
    floor = _floorsFlats[0].floorNumber;
    flat = 0;
    flatsLeft = _floorsFlats[0].flatsAmount;
  }

  HouseModel.restore(
      this.pk,
      this.sid,
      this.slug,
      this.buildingName,
      this.sectionNumber,
      this._floorsFlats,
      this.floor,
      this.flat,
      this.flatsLeft,
      this.hasNoProgress,
      this.buildingCovered,
      this._floorIndex);

  List<FloorModel> getFloorsFlats() => _floorsFlats;
  int getFloorIndex() => _floorIndex;

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
