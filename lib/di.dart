import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/accelerometer/accelerometer_controller.dart';
import 'package:frontend/camera/presentation/house_page_change_notifier.dart';
import 'package:frontend/camera/presentation/house_page_controller.dart';
import 'package:frontend/core/presentation/house_pages_change_notifier.dart';
import 'package:frontend/core/presentation/house_picking_page_controller.dart';
import 'package:frontend/core/presentation/main_page_controller.dart';
import 'package:frontend/persistence/storage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'core/data/api.dart';
import 'location/location_history.dart';
import 'location/location_manager.dart';
import 'models/house_model.dart';

class DI {
  static final cameraControllerProvider =
      StateProvider<CameraController?>((_) => null);
  static final locationHistoryProvider =
      ChangeNotifierProvider<LocationHistory>((_) => LocationHistory());
  static final locationManagerProvider =
      Provider((ref) => LocationManager(ref));
  static final housePageState = ChangeNotifierProvider<HousePageChangeNotifier>(
      (_) => HousePageChangeNotifier());

  static final storageProvider = Provider<Storage>((_) => Storage());
  static final mainPageController =
      Provider<MainPageController>((ref) => MainPageController(ref));
  static final housePagesChangeNotifier =
      ChangeNotifierProvider<HousePagesChangeNotifier>(
          (_) => HousePagesChangeNotifier());
  static final housePageControllerProvider =
      Provider((ref) => HousePageController(ref));

  // API
  static final api = Provider<API>((_) => API());

  // house picking page
  static final housePickingPageControllerProvider =
      Provider((ref) => HousePickingPageController(ref));
  static final locationPermissionStatus =
      StateProvider<PermissionStatus?>((_) => null);
  static final availableHousesList =
      StateProvider<List<HouseModel>?>((_) => null);

  // accelerometer
  static final accelerometerControllerProvider =
      Provider((ref) => AccelerometerController(ref));
}
