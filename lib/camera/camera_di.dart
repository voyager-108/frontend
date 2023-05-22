import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/presentation/camera_page_controller.dart';
import 'package:frontend/camera/presentation/camera_page_states.dart';
import 'package:frontend/models/house_model.dart';
import 'package:frontend/models/progress_model.dart';

class CameraDI {
  static final isRecording = StateProvider<bool>((ref) => false);
  static final isCameraInitialized = StateProvider<bool>((ref) => false);
  static final cameraPageControllerProvider =
      Provider((_) => CameraPageController());
}
