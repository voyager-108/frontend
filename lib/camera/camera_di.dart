import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/presentation/camera_page_controller.dart';

class CameraDI {
  static final isRecording = StateProvider<bool>((ref) => false);
  static final cameraPageControllerProvider =
      Provider((_) => CameraPageController());
}
