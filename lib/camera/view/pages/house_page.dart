import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/pages/progress_page.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../di.dart';
import '../../camera_di.dart';

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
    if (ref.watch(CameraDI.cameraPermissionStatus) !=
        PermissionStatus.granted) {
      // There is no access to the camera
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Нет доступа к камере",
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.apply(color: Colors.black87),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Чтобы приложение работало, необходимо дать доступ к камере. Это можно сделать в настройках.",
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      openAppSettings();
                    },
                    child: const Text("Открыть настройки доступа")),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "После изменения настроек доступа приложение надо перезапустить.",
                  textAlign: TextAlign.start,
                ),
              ]),
        ),
      );
    }
    return const ProgressPage();
  }
}
