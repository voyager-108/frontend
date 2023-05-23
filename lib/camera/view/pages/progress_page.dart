import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di.dart';
import '../../../models/progress_model.dart';
import '../../camera_di.dart';
import '../widgets/floor_title.dart';

class ProgressPage extends ConsumerStatefulWidget {
  const ProgressPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressPageState();
}

class _ProgressPageState extends ConsumerState<ProgressPage> {
  @override
  Widget build(BuildContext context) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: [
            const FloorTitle(),
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
            // TODO make another widget for the empty list
            Expanded(
              child: ListView.builder(
                  itemCount: ref.watch(DI.housePageState).progressLength(),
                  itemBuilder: (context, index) {
                    switch (
                        ref.watch(DI.housePageState).progressElement(index)) {
                      case FloorProgressLoading state:
                        return ListTile(
                          title: Text(
                              "Этаж ${state.floorNumber}, квартира ${state.flatNumber}"),
                          subtitle: Text(state.status),
                        );
                      case FloorProgressDone state:
                        return ListTile(
                          title: Text(
                              "Этаж ${state.floorNumber}, квартира ${state.flatNumber}"),
                          subtitle: Text("${state.progress}%"),
                          trailing: IconButton(
                            icon: const Icon(Icons.info_rounded),
                            onPressed: () {
                              //TODO show something on pressing the info button
                            },
                          ),
                        );
                    }
                  }),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: ElevatedButton(
                    onPressed: () {
                      ref
                          .read(CameraDI.cameraPageControllerProvider)
                          .startRecording(ref);
                    },
                    child: Text(
                        "Записать квартиру ${ref.watch(DI.housePageState).currentFlat()}")),
              ),
            )
          ],
        ),
      );
}
