import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/di.dart';
import 'dart:developer' as dev;

import '../camera_di.dart';

class CameraPageController {
  bool isRecording = false;
  CameraController? cameraController;
  Timer? timer;
  static const int splitPeriod = 5;

  Future<void> initCamera(WidgetRef ref) async {
    final cameras = await availableCameras();
    final cam = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    cameraController =
        CameraController(cam, ResolutionPreset.high, enableAudio: false);
    ref.read(DI.cameraControllerProvider.notifier).state = cameraController;
    await cameraController!.initialize();
    ref.read(CameraDI.isCameraInitialized.notifier).state = true;
    timer = Timer.periodic(const Duration(seconds: splitPeriod), (_) {
      dev.log("Trying to split the recording");
      splitRecording();
    });
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
  }

  void splitRecording() async {
    if (!isRecording) return;
    dev.log("Split the video");
    // final file =
    //     await cameraController!.stopVideoRecording();
    // // DO something on obtaining the file
    // // Start recording the next video
    // await cameraController!.startVideoRecording();
  }
}
