import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/widgets/empty_progress_widget.dart';
import 'package:frontend/camera/view/widgets/full_progress_widget.dart';
import 'package:frontend/camera/view/widgets/progress_list.dart';

import '../../../core/view/fade_page_route.dart';
import '../../../di.dart';
import '../../camera_di.dart';
import '../pages/camera_page.dart';

class ProgressWidget extends ConsumerWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(DI.housePageState).hasNoProgress()) {
      // show you have no progress
      return const EmptyProgressWidget();
    } else if (ref.watch(DI.housePageState).isBuildingCovered()) {
      // show the building is fully covered
      return const FullProgressWidget();
    }
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "Прогресс",
              textAlign: TextAlign.start,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.apply(color: Colors.black87),
            ),
          ),
          const Expanded(
            child: ProgressList(),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
                onPressed: () {
                  ref
                      .read(CameraDI.cameraPageControllerProvider)
                      .startRecording(ref);
                  Navigator.push(
                      context,
                      FadePageRoute(ProviderScope(
                        parent: ProviderScope.containerOf(context),
                        child: const CameraPage(),
                      )));
                },
                child: const Text("Записать следующую квартиру")),
          )
        ],
      ),
    );
  }
}
