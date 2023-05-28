import 'dart:async';

import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/di.dart';
import 'package:frontend/models/house_progress_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_compress/video_compress.dart';

import '../camera_di.dart';
import 'dart:developer' as dev;

class CameraPageController {
  final Ref _ref;
  bool isRecording = false;
  CameraController? cameraController;
  static const int splitPeriod = 5;

  CameraPageController(this._ref);

  Future<void> initCamera() async {
    updatePermissionStatus();
    final cameras = await availableCameras();
    final cam = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    cameraController =
        CameraController(cam, ResolutionPreset.high, enableAudio: false);
    _ref.read(DI.cameraControllerProvider.notifier).state = cameraController;
    await cameraController!.initialize();
    _ref.read(CameraDI.isCameraInitialized.notifier).state = true;
  }

  void updatePermissionStatus() async {
    _ref.read(CameraDI.cameraPermissionStatus.notifier).state =
        await Permission.camera.status;
  }

  void dispose(WidgetRef ref) {
    ref.read(DI.cameraControllerProvider)?.dispose();
  }

  void startRecording() async {
    if (isRecording) return;
    dev.log("Started recording a new video");
    _ref.read(DI.housePageState.notifier).startRecording();
    _ref.read(DI.locationHistoryProvider).startRecording();
    cameraController!.prepareForVideoRecording();
    cameraController!.startVideoRecording();
    isRecording = true;
  }

  void stopRecording() async {
    if (!isRecording) return;
    final floor = _ref.read(DI.housePageState).currentFloor();
    final flat = _ref.read(DI.housePageState).currentFlat();
    _ref.read(DI.housePageState.notifier).stopRecording();
    final pIndex = _ref
        .read(DI.housePageState.notifier)
        .addProgress(FloorProgressModel.withFlat(floor, flat, "Сохранение"));
    dev.log("Stopped recording the video");
    final file = await cameraController!.stopVideoRecording();
    isRecording = false;
    final locations = _ref.read(DI.locationHistoryProvider).stopRecording();
    _ref.read(DI.housePageState.notifier).updateProgress(pIndex, "Сжатие");
    final compressedVideo = await VideoCompress.compressVideo(file.path,
        includeAudio: false, frameRate: 3);
    _ref.read(DI.housePageState.notifier).updateProgress(pIndex, "Обработка");
    // if (compressedVideo == null) {
    //   _ref.read(DI.api).uploadVideo(File(file.path), locations);
    // } else {
    //   _ref.read(DI.api).uploadVideo(compressedVideo.file, locations);
    // }
    // TODO API call
    _ref.read(DI.housePageState.notifier).updateProgress(pIndex, "Проценты");
  }
}
