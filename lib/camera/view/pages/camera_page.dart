import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/widgets/floor_title.dart';

import '../../../di.dart';
import '../../camera_di.dart';

class CameraPage extends ConsumerStatefulWidget {
  const CameraPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CameraPage> {
  @override
  Widget build(BuildContext context) {
    if (ref.watch(DI.cameraControllerProvider) == null ||
        !ref.watch(CameraDI.isCameraInitialized)) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CameraPreview(ref.read(DI.cameraControllerProvider)!),
            Column(
              children: [
                const FloorTitle(),
                const Spacer(),
                ElevatedButton(
                    onPressed: () {
                      ref
                          .read(CameraDI.cameraPageControllerProvider)
                          .stopRecording(ref);
                    },
                    child: const Text("Закончить запись квартиры"))
              ],
            )
          ],
        ),
      );
    }
  }
}