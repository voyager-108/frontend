import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/pages/progress_page.dart';

import '../../../di.dart';
import '../../camera_di.dart';
import 'camera_page.dart';
import 'dart:developer' as dev;

class HousePage extends ConsumerStatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HousePage> createState() => _HousePageState();
}

class _HousePageState extends ConsumerState<HousePage> {
  @override
  void initState() {
    ref.read(CameraDI.cameraPageControllerProvider).initCamera(ref);
    super.initState();
  }

  @override
  void dispose() {
    ref.read(DI.cameraControllerProvider)?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!ref.watch(CameraDI.isCameraInitialized)) {
      // The camera is not initialized
      return const Center(
        child: Text("Нет доступа к камере"),
      );
    }
    return const ProgressPage();
  }
}
