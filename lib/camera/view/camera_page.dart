import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di.dart';
import '../camera_di.dart';

class CameraPage extends ConsumerStatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends ConsumerState<CameraPage> {
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
            Padding(
              padding: const EdgeInsets.all(25),
              child: FloatingActionButton(
                backgroundColor: Colors.red,
                child: Icon(ref.watch(CameraDI.isRecording)
                    ? Icons.stop
                    : Icons.circle),
                onPressed: () => ref
                    .read(CameraDI.cameraPageControllerProvider)
                    .recordVideo(ref),
              ),
            ),
          ],
        ),
      );
    }
  }
}
