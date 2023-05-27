import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/view/fade_page_route.dart';
import '../../camera_di.dart';
import '../pages/camera_page.dart';

class EmptyProgressWidget extends ConsumerWidget {
  const EmptyProgressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Здесь будет отображаться прогресс",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.apply(color: Colors.black87),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
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
                  child: const Text("Записать первую квартиру"))
            ],
          ),
        ),
      );
}
