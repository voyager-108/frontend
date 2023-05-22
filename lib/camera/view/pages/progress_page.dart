import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di.dart';
import '../../../models/progress_model.dart';
import '../widgets/floor_title.dart';

class ProgressPage extends ConsumerStatefulWidget {
  const ProgressPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressPageState();
}

class _ProgressPageState extends ConsumerState<ProgressPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: [
            const FloorTitle(),
            Text(
              "Прогресс",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.apply(color: Theme.of(context).colorScheme.secondary),
            ),
            ListView.builder(itemBuilder: (context, index) {
              switch (ref.watch(DI.housePageState).progress.progress[index]) {
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
            const Spacer(),
            ElevatedButton(
                onPressed: () {
                  // TODO start recording on pressing the recording button
                },
                child: Text(
                    "Записать ${ref.watch(DI.housePageState).house.currentFloor + 1} этаж"))
          ],
        ),
      );
}
