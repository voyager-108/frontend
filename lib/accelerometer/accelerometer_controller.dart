import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/camera_di.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'dart:developer' as dev;

class AccelerometerController {
  static const threshold = 1;
  Ref _ref;

  AccelerometerController(this._ref) {
    userAccelerometerEvents.listen(
      (UserAccelerometerEvent event) {
        final oldStatus = _ref.read(CameraDI.isCameraMovingTooFast);
        final newStatus = [event.x, event.y, event.z].any((v) => v.abs() > 0.7);
        if (oldStatus != newStatus) {
          _ref.read(CameraDI.isCameraMovingTooFast.notifier).state = newStatus;
        }
      },
      onError: (error) {
        dev.log("$error");
      },
      cancelOnError: true,
    );
  }
}
