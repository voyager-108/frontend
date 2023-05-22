import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/di.dart';
import 'dart:developer' as dev;

import '../camera_di.dart';

class CameraPageController {
  Future<void> initCamera(WidgetRef ref) async {
    final cameras = await availableCameras();
    final cam = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    ref.read(DI.cameraControllerProvider.notifier).state =
        CameraController(cam, ResolutionPreset.high, enableAudio: false);
    await ref.read(DI.cameraControllerProvider)!.initialize();
    ref.read(CameraDI.isCameraInitialized.notifier).state = true;
  }

  void recordVideo(WidgetRef ref) async {
    dev.log("Started recording a new video");
    if (ref.read(CameraDI.isRecording)) {
      dev.log("Stopped recording the old video");
      final file =
          await ref.read(DI.cameraControllerProvider)!.stopVideoRecording();
      ref.read(CameraDI.isRecording.notifier).state = false;
      recordVideo(ref);
      // DO something on obtaining the file
    } else {
      await ref.read(DI.cameraControllerProvider)!.prepareForVideoRecording();
      await ref.read(DI.cameraControllerProvider)!.startVideoRecording();
      ref.read(CameraDI.isRecording.notifier).state = true;
    }
  }
}
