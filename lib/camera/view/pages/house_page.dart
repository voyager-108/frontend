import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/pages/progress_page.dart';

import '../../../di.dart';
import '../../camera_di.dart';
import 'camera_page.dart';

class HousePage extends ConsumerStatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HousePage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<HousePage> {
  @override
  void initState() {
    ref.read(CameraDI.cameraPageControllerProvider).initCamera(ref);
    super.initState();
    ref.read(DI.locationManagerProvider);
  }

  @override
  void dispose() {
    ref.read(DI.cameraControllerProvider)?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(DI.housePageState).currentlyRecordingFloor == null) {
      // The camera is idle
      return const ProgressPage();
    } else {
      // The camera is recording
      return const CameraPage();
    }
  }
}
