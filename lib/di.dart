import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'camera/presentation/camera_page_states.dart';
import 'location/location_history.dart';
import 'location/location_manager.dart';
import 'models/house_model.dart';
import 'models/progress_model.dart';

class DI {
  static final cameraControllerProvider =
      StateProvider<CameraController?>((_) => null);
  static final locationHistoryProvider =
      Provider<LocationHistory>((_) => LocationHistory());
  static final locationManagerProvider =
      Provider((ref) => LocationManager(ref));
  static final housePageState =
      StateProvider<CameraPageStates>((_) => CameraPageStates(
          HouseModel([
            FloorModel(1, 12),
            FloorModel(2, 11),
            FloorModel(3, 13),
            FloorModel(4, 10),
          ]),
          HouseProgressModel()));
}
