import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/view/fade_page_route.dart';
import '../../../di.dart';
import '../../camera_di.dart';
import '../pages/camera_page.dart';

class ProgressWidgetActions extends ConsumerWidget {
  const ProgressWidgetActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(DI.housePageState).isBuildingCovered()!) {
      // show the building is fully covered
      return ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("На главную"));
    }
    // the progress is not full
    return Column(
      children: [
        ElevatedButton(
            onPressed: () {
              ref.read(CameraDI.cameraPageControllerProvider).startRecording();
              Navigator.push(
                  context,
                  FadePageRoute(ProviderScope(
                    parent: ProviderScope.containerOf(context),
                    child: const CameraPage(),
                  )));
            },
            child: const Text("Записать следующую квартиру")),
        TextButton(
            onPressed: () {
              ref.read(DI.housePageState).moveNextFloor();
            },
            child: const Text("Перейти на следующий этаж"))
      ],
    );
  }
}
