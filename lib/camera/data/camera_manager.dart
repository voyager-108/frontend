import 'package:camera/camera.dart';
import 'dart:io';

import 'camera_state.dart';

class CameraManager {
  CameraController camera;
  CameraState state;
  File? lastFile;

  CameraManager(this.camera, this.state);
  CameraManager.def(this.camera) : state = CameraState.idle;

  Future<void> init() async {
    await camera.initialize();
  }

  Future<void> dispose() async {
    await camera.dispose();
  }

  Future<void> startRecording() async {
    await camera.startVideoRecording();
    await Future.delayed(const Duration(milliseconds: 100), () {
      state = CameraState.recording;
    });
  }

  Future<void> stopRecording() async {
    await Future.delayed(const Duration(milliseconds: 500), () async {
      await camera.stopVideoRecording();
      state = CameraState.idle;
    });
  }

  Future<void> start() async {
    final startTime = DateTime.now();
    const delta = Duration(seconds: 5);
    while (state == CameraState.preparing &&
        DateTime.now().subtract(delta).compareTo(startTime) < 0) {
      // wait
    }
    // if the state is still incorrect
    if (state == CameraState.preparing || state == CameraState.recording)
      return;
    state = CameraState.preparing;
    await camera.prepareForVideoRecording();
    await startRecording();
  }

  Future<File?> split() async {
    if (state == CameraState.idle || state == CameraState.preparing)
      return null;
    state = CameraState.preparing;
    lastFile = File((await camera.stopVideoRecording()).path);
    startRecording();
    return lastFile;
  }

  Future<File?> cleanLastFile() async {
    final file = lastFile;
    lastFile = null;
    return file;
  }

  Future<File?> stop() async {
    if (state == CameraState.idle) return null;
    if (state == CameraState.preparing) {
      print("--- Preparing state ---");
      stopRecording();
      final file = lastFile;
      lastFile = null;
      return file;
    }
    print("--- Recording ---");
    state = CameraState.preparing;
    lastFile = null;
    final file = File((await camera.stopVideoRecording()).path);
    state = CameraState.idle;
    return file;
  }
}
