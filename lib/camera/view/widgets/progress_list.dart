import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../di.dart';
import '../../../models/house_progress_model.dart';

class ProgressList extends ConsumerWidget {
  const ProgressList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => ListView.builder(
      itemCount: ref.watch(DI.housePageState).progressLength(),
      itemBuilder: (context, index) {
        final state = ref.watch(DI.housePageState).progressElement(index);
        return ListTile(
          title:
              Text("Этаж ${state.floorNumber}, квартира ${state.flatNumber}"),
          subtitle: state.status == null ? null : Text(state.status!),
        );
      });
}
