import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di.dart';

class FloorTitle extends ConsumerStatefulWidget {
  const FloorTitle({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FloorTitleState();
}

class _FloorTitleState extends ConsumerState<FloorTitle> {
  bool lightTheme = true;

  @override
  Widget build(BuildContext context) {
    lightTheme = !ref.watch(DI.housePageState).isRecording();
    return Container(
      decoration: lightTheme
          ? const BoxDecoration()
          : BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Colors.black.withOpacity(0.7),
                  Colors.black.withOpacity(0.0),
                ],
              ),
            ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Text("${ref.watch(DI.housePageState).currentFloor()} этаж",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge
                    ?.apply(color: lightTheme ? Colors.black87 : Colors.white)),
            Text(
              lightTheme
                  ? "Осталось ${ref.watch(DI.housePageState).currentFlatsLeft()} квартиры на этаже"
                  : "Записывается ${ref.watch(DI.housePageState).currentFlat()} квартира, осталось ${ref.watch(DI.housePageState).currentFlatsLeft()}",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.bodyMedium?.apply(
                  color: lightTheme
                      ? Colors.black54
                      : Colors.white.withOpacity(0.5)),
            ),
            SizedBox(
              height: lightTheme ? 16 : 80,
            )
          ],
        ),
      ),
    );
  }
}
