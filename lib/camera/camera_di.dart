import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/presentation/camera_page_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraDI {
  static final isCameraInitialized = StateProvider<bool>((_) => false);
  static final cameraPermissionStatus =
      StateProvider<PermissionStatus?>((_) => null);
  static final cameraPageControllerProvider =
      Provider((_) => CameraPageController());
}
