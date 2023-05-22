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
    if (ref.watch(DI.housePageState).currentlyRecordingFloor == null) {
      // the floor is being recorded
      lightTheme = false;
    } else {
      // the user watches on the progress
      lightTheme = true;
    }
    return Stack(children: [
      Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: <Color>[
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.0),
          ],
        ),
      )),
      Column(
        children: [
          Text(
            "${ref.watch(DI.housePageState).house.currentFloor} этаж",
            style: Theme.of(context).textTheme.titleLarge?.apply(
                color: lightTheme
                    ? Theme.of(context).colorScheme.primary
                    : Colors.white),
          ),
          Text(
            "Осталось ${ref.watch(DI.housePageState).house.currentFlatsLeft} квартиры на этаже",
            style: Theme.of(context).textTheme.bodyMedium?.apply(
                color: lightTheme
                    ? Theme.of(context).colorScheme.secondary
                    : Colors.white70),
          )
        ],
      ),
    ]);
  }
}
