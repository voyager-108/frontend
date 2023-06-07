import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/widgets/empty_progress_widget.dart';
import 'package:frontend/camera/view/widgets/progress_list.dart';
import 'package:frontend/camera/view/widgets/progress_widget_actions.dart';

import '../../../di.dart';

class ProgressWidget extends ConsumerWidget {
  const ProgressWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!ref.watch(DI.housePageState).hasState()) {
      return const Center(
        child: Text("Unexpected Error"),
      );
    }
    if (ref.watch(DI.housePageState).hasNoProgress()!) {
      // show you have no progress
      return const EmptyProgressWidget();
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
          const ProgressList(),
          const Padding(
            padding: EdgeInsets.only(
                left: 16.0, right: 16.0, bottom: 16.0, top: 8.0),
            child: ProgressWidgetActions(),
          )
        ],
      ),
    );
  }
}
