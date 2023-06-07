import '../core/presentation/progress_video_state.dart';

class FloorProgressModel {
  final int floorNumber;
  final int flatNumber;
  String? status;
  ProcessedVideoState statusState = ProcessedVideoState.none;

  FloorProgressModel.withFlat(
      this.floorNumber, this.flatNumber, this.statusState,
      [this.status]);
  FloorProgressModel.restore(
      this.floorNumber, this.flatNumber, this.status, this.statusState);
}

class HouseProgressModel {
  List<FloorProgressModel> progress;

  HouseProgressModel() : progress = List.empty(growable: true);
  HouseProgressModel.restore(this.progress);
}
