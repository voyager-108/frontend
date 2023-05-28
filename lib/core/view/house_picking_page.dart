import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/view/widgets/house_picking_list.dart';
import 'package:frontend/di.dart';
import 'package:permission_handler/permission_handler.dart';

class HousePickingPage extends ConsumerStatefulWidget {
  const HousePickingPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HousePickingPageState();
}

class _HousePickingPageState extends ConsumerState<ConsumerStatefulWidget> {
  @override
  void initState() {
    ref.read(DI.housePickingPageControllerProvider).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final status = ref.watch(DI.locationPermissionStatus);
    if (status != PermissionStatus.granted) {
      return Material(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Нет доступа к локации",
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
                    "Чтобы приложение работало, необходимо дать доступ к геолокации. Это можно сделать в настройках.",
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
                        ref
                            .read(DI.housePickingPageControllerProvider)
                            .updatePermissionStatus();
                      },
                      child: const Text("Обновить локацию")),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Если после нажатия кнопки экран не пропал, перезагрузите приложение",
                    textAlign: TextAlign.start,
                  ),
                ]),
          ),
        ),
      );
    } else if (ref.watch(DI.locationHistoryProvider).getLocation() == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return const HousePickingList();
  }
}
