class FloorProgressModel {
  final int floorNumber;
  final int flatNumber;
  String? status;

  FloorProgressModel()
      : floorNumber = 0,
        flatNumber = 0;
  FloorProgressModel.withFlat(this.floorNumber, this.flatNumber, [this.status]);
  FloorProgressModel.restore(this.floorNumber, this.flatNumber, this.status);
}

class HouseProgressModel {
  List<FloorProgressModel> progress;

  HouseProgressModel() : progress = List.empty(growable: true);
  HouseProgressModel.restore(this.progress);
}
