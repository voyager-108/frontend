import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/presentation/camera_page_change_notifier.dart';
import 'package:frontend/core/presentation/house_pages_change_notifier.dart';
import 'package:frontend/core/presentation/main_page_controller.dart';
import 'package:frontend/persistence/storage.dart';

import 'camera/presentation/house_page_state.dart';
import 'location/location_history.dart';
import 'location/location_manager.dart';

class DI {
  static final cameraControllerProvider =
      StateProvider<CameraController?>((_) => null);
  static final locationHistoryProvider =
      Provider<LocationHistory>((_) => LocationHistory());
  static final locationManagerProvider =
      Provider((ref) => LocationManager(ref));
  static final housePageState =
      ChangeNotifierProvider<CameraPageChangeNotifier>(
          (_) => CameraPageChangeNotifier());

  static final storageProvider = Provider<Storage>((_) => Storage());
  static final mainPageController = Provider<MainPageController>(
      (ref) => MainPageController(ref.read(storageProvider)));
  // static final housePagesProvider =
  //     StateProvider<List<HousePageState>>((_) => []);
  static final housePagesChangeNotifier =
      ChangeNotifierProvider<HousePagesChangeNotifier>(
          (_) => HousePagesChangeNotifier());
}
