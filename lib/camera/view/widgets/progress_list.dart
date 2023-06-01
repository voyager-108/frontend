import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/presentation/progress_view_type.dart';

import '../../../di.dart';

class ProgressList extends ConsumerWidget {
  const ProgressList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (ref.watch(DI.progressViewType) == ProgressViewType.list) {
      return ListView.builder(
          itemCount: ref.watch(DI.housePageState).progressLength(),
          itemBuilder: (context, index) {
            final state = ref.watch(DI.housePageState).progressElement(index)!;
            return ListTile(
              title: Text(
                  "Этаж ${state.floorNumber}, квартира ${state.flatNumber}"),
              subtitle: state.status == null ? null : Text(state.status!),
            );
          });
    }
    // ProgressViewType.grid
    // TODO not working
    final gridData = ref.read(DI.housePageState).formProgressGrid();
    return ListView.builder(
        itemCount: gridData.length,
        itemBuilder: (context, index) {
          return GridView.count(
            crossAxisCount: gridData[index].length,
            children: gridData[index].map((e) => Text(e ?? "")).toList(),
          );
        });
  }
}
