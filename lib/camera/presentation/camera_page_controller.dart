import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/di.dart';
import 'package:permission_handler/permission_handler.dart';

import '../camera_di.dart';

class CameraPageController {
  bool isRecording = false;
  CameraController? cameraController;
  static const int splitPeriod = 5;

  Future<void> initCamera(WidgetRef ref) async {
    updatePermissionStatus(ref);
    final cameras = await availableCameras();
    final cam = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    cameraController =
        CameraController(cam, ResolutionPreset.high, enableAudio: false);
    ref.read(DI.cameraControllerProvider.notifier).state = cameraController;
    await cameraController!.initialize();
    ref.read(CameraDI.isCameraInitialized.notifier).state = true;
  }

  void updatePermissionStatus(WidgetRef ref) async {
    ref.read(CameraDI.cameraPermissionStatus.notifier).state =
        await Permission.camera.status;
  }

  void dispose(WidgetRef ref) {
    ref.read(DI.cameraControllerProvider)?.dispose();
  }

  void startRecording(WidgetRef ref) async {
    if (isRecording) return;
    // dev.log("Started recording a new video");
    ref.read(DI.housePageState.notifier).startRecording();
    // cameraController!.prepareForVideoRecording();
    // cameraController!.startVideoRecording();
    isRecording = true;
  }

  void stopRecording(WidgetRef ref) async {
    if (!isRecording) return;
    // dev.log("Stopped recording the video");
    // final file =
    //     cameraController!.stopVideoRecording();
    ref.read(DI.housePageState.notifier).stopRecording();
    // // DO something on obtaining the file
    isRecording = false;
    // ref.read(DI.api).
  }
}
