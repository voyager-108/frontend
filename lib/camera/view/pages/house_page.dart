import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/presentation/house_page_controller.dart';
import 'package:frontend/camera/view/pages/progress_page.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../di.dart';
import '../../camera_di.dart';
import '../../presentation/camera_page_controller.dart';

class HousePage extends ConsumerStatefulWidget {
  const HousePage({Key? key}) : super(key: key);

  @override
  ConsumerState<HousePage> createState() => _HousePageState();
}

class _HousePageState extends ConsumerState<HousePage> {
  late final CameraPageController cameraController;
  late final HousePageController housePageController;

  @override
  void initState() {
    cameraController = ref.read(CameraDI.cameraPageControllerProvider);
    housePageController = ref.read(DI.housePageControllerProvider);
    housePageController.loadFloorsFlats();
    housePageController.setFloor();
    ref.read(DI.accelerometerControllerProvider);
    cameraController.initCamera();
    super.initState();
  }

  @override
  void deactivate() {
    cameraController.dispose(ref);
    housePageController.dispose();
    super.deactivate();
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
                    child: const Text("Открыть настройки")),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "После выдачи разрешения нажмите кнопку ниже",
                  textAlign: TextAlign.start,
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                    onPressed: () {
                      cameraController.updatePermissionStatus();
                    },
                    child: const Text("Подключиться к камере")),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "Если после нажатия кнопки экран не пропал, перезагрузите приложение",
                  textAlign: TextAlign.start,
                ),
              ]),
        ),
      );
    }
    if (!ref.watch(DI.housePageState).areFloorsFlatsSet) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const ProgressPage();
  }
}
