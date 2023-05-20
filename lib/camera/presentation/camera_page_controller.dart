import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/di.dart';

import '../camera_di.dart';

class CameraPageController {
  Future<void> initCamera(WidgetRef ref) async {
    final cameras = await availableCameras();
    final cam = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    ref.read(DI.cameraControllerProvider.notifier).state =
        CameraController(cam, ResolutionPreset.high);
    await ref.read(DI.cameraControllerProvider)!.initialize();
  }

  void recordVideo(WidgetRef ref) async {
    if (ref.read(CameraDI.isRecording)) {
      final file =
          await ref.read(DI.cameraControllerProvider)!.stopVideoRecording();
      ref.read(CameraDI.isRecording.notifier).state = false;
      // DO something on obtaining the file
    } else {
      await ref.read(DI.cameraControllerProvider)!.prepareForVideoRecording();
      await ref.read(DI.cameraControllerProvider)!.startVideoRecording();
      ref.read(CameraDI.isRecording.notifier).state = true;
    }
  }
}
