import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/camera_di.dart';
import 'package:sensors_plus/sensors_plus.dart' hide MagnetometerEvent;
import 'dart:developer' as dev;
import 'package:ml_linalg/linalg.dart';
import 'dart:math';

import '../di.dart';

class AccelerometerController {
  static const threshold = 1;
  final Ref _ref;
  late final Timer timer;
  // UserAccelerometerEvent? lastAccel;
  // GyroscopeEvent? lastGyro;
  static int period = 1;

  AccelerometerController(this._ref) {
    // final gyro = Gyro(period.toDouble() / 1000);
    // final accel = Acceler(period.toDouble() / 1000);

    // gyroscope
    // timer = Timer.periodic(Duration(milliseconds: period), (timer) {
    //   if (lastGyro == null || lastAccel == null) return;
    //   final data = lastGyro!;
    //   print(data);
    //   var distances = gyro.addVeloc(data);
    //   // print("----DIST----");
    //   // print("$distances");
    //   final mat = orientationMat(distances[0], distances[1], distances[2]);
    //   final accelData = lastAccel!;
    //
    //   final accelNew = (mat.inverse(Inverse.LU) *
    //           Vector.fromList([accelData.x, accelData.y, accelData.z]))
    //       .toList(growable: false);
    //   distances = accel.addAcceler(UserAccelerometerEvent(
    //       accelNew[0].toList()[0],
    //       accelNew[1].toList()[0],
    //       accelNew[2].toList()[0]));
    //
    //   // print(distances[2]);
    //   // _ref.read(DI.userHeight.notifier).state = result[0][2];
    // });

    // gyroscopeEvents.listen((event) {
    //   lastGyro = event;
    // });

    userAccelerometerEvents.listen(
      (event) {
        // lastAccel = event;
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

// Matrix orientationMat(double pitch, double roll, double yaw) {
//   final pitch_mat = Matrix.fromList([
//     [cos(pitch), -sin(pitch), 0],
//     [sin(pitch), cos(pitch), 0],
//     [0, 0, 1]
//   ]);
//
//   final roll_mat = Matrix.fromList([
//     [cos(roll), 0, sin(roll)],
//     [0, 1, 0],
//     [-sin(roll), 0, cos(roll)]
//   ]);
//
//   final yaw_mat = Matrix.fromList([
//     [1, 0, 0],
//     [0, cos(yaw), -sin(yaw)],
//     [0, sin(yaw), cos(yaw)]
//   ]);
//
//   final mat = pitch_mat * roll_mat * yaw_mat;
//
//   return mat;
// }
//
// class Acceler {
//   double timeDelta;
//   double distanceX = 0;
//   double distanceY = 0;
//   double distanceZ = 0;
//   double velocityX = 0;
//   double velocityY = 0;
//   double velocityZ = 0;
//   Acceler(double delta) : timeDelta = delta;
//
//   List<double> addAcceler(UserAccelerometerEvent value) {
//     velocityX += value.x * timeDelta;
//     velocityY += value.y * timeDelta;
//     velocityZ += value.z * timeDelta;
//     distanceX += velocityX * timeDelta;
//     distanceY += velocityX * timeDelta;
//     distanceZ += velocityX * timeDelta;
//     return [distanceX, distanceY, distanceZ];
//   }
// }
//
// class Gyro {
//   double timeDelta;
//   double distanceX = 0;
//   double distanceY = 0;
//   double distanceZ = 0;
//   Gyro(double delta) : timeDelta = delta;
//
//   List<double> addVeloc(GyroscopeEvent value) {
//     distanceX += value.x * timeDelta;
//     distanceY += value.y * timeDelta;
//     distanceZ += value.z * timeDelta;
//     return [distanceX, distanceY, distanceZ];
//   }
// }
