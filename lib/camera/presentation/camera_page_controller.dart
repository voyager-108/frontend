import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/data/camera_manager.dart';
import 'package:frontend/di.dart';
import 'package:frontend/models/house_progress_model.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/presentation/progress_video_state.dart';
import '../camera_di.dart';
import 'dart:developer' as dev;

class CameraPageController {
  final Ref _ref;
  CameraManager? manager;
  static const int splitPeriod = 5;
  late final Timer timer;

  CameraPageController(this._ref) {
    // timer = Timer.periodic(const Duration(seconds: splitPeriod), (timer) {
    //   if (timer.tick != 0) {
    //     splitRecording();
    //   }
    // });
  }

  Future<void> initCamera() async {
    updatePermissionStatus();
    final cameras = await availableCameras();
    final cam = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back);
    manager = CameraManager.def(
        CameraController(cam, ResolutionPreset.medium, enableAudio: false));
    _ref.read(DI.cameraControllerProvider.notifier).state = manager?.camera;
    await manager?.init();
    _ref.read(CameraDI.isCameraInitialized.notifier).state = true;
  }

  void updatePermissionStatus() async {
    _ref.read(CameraDI.cameraPermissionStatus.notifier).state =
        await Permission.camera.status;
  }

  void dispose(WidgetRef ref) {
    manager?.dispose();
  }

  void startRecording() async {
    dev.log("Started recording a new video");
    _ref.read(DI.housePageState).startRecording();
    // Locations
    _ref.read(DI.locationHistoryProvider).startRecording();
    await manager?.start();
  }

  // void splitRecording() async {
  //   dev.log("Split the video");
  //   final file = await manager?.split();
  //   try {
  //     _ref.read(DI.api).uploadVideo(file!);
  //   } catch (e) {
  //     dev.log("Error while uploading the video in the split");
  //   }
  // }

  void stopRecording() async {
    if (_ref.read(DI.housePageState).getState() == null) {
      manager?.stop();
      return;
    }
    final floor = _ref.read(DI.housePageState).currentFloor()!;
    final flat = _ref.read(DI.housePageState).currentFlat()!;
    _ref.read(DI.housePageState).stopRecording();
    final pIndex = _ref.read(DI.housePageState.notifier).addProgress(
        FloorProgressModel.withFlat(
            floor, flat, ProcessedVideoState.save, "Сохранение"))!;
    dev.log("Stopped recording the video");
    final file = await manager?.stop();
    // Locations don't work
    final locations = _ref.read(DI.locationHistoryProvider).stopRecording();
    _ref.read(DI.housePageState.notifier).updateProgress(
        pIndex, ProcessedVideoState.upload, "Загрузка и обработка");
    try {
      int percent =
          await _ref.read(DI.api).uploadVideo(file!, locations, isLast: true) ??
              0;
      _ref
          .read(DI.housePageState.notifier)
          .updateProgress(pIndex, ProcessedVideoState.result, "$percent%");
    } catch (e) {
      _ref.read(DI.housePageState.notifier).updateProgress(
          pIndex, ProcessedVideoState.error, "Не удалось выгрузить видео");
    }
  }
}
