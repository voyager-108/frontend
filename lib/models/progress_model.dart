sealed class FloorProgressModel {
  int floorNumber;
  int flatNumber;

  FloorProgressModel(this.floorNumber, this.flatNumber);
}

class FloorProgressLoading extends FloorProgressModel {
  String status;

  FloorProgressLoading(super.floorNumber, super.flatNumber, this.status);
}

class FloorProgressDone extends FloorProgressModel {
  int progress;
  AdditionalInfoModel info;

  FloorProgressDone(
      super.floorNumber, super.flatNumber, this.progress, this.info);
}

class AdditionalInfoModel {}

class HouseProgressModel {
  List<FloorProgressModel> progress;

  HouseProgressModel() : progress = [];
}
