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
    if (!ref.watch(CameraDI.isCameraInitialized)) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              color: Colors.black,
            ),
            CameraPreview(ref.read(DI.cameraControllerProvider)!),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const FloorTitle(),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        ref
                            .read(CameraDI.cameraPageControllerProvider)
                            .stopRecording(ref);
                        Navigator.pop(context);
                      },
                      child: const Text("Закончить запись квартиры")),
                )
              ],
            )
          ],
        ),
      );
    }
  }
}
