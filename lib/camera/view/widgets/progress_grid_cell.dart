import 'package:flutter/material.dart';

import '../../../core/presentation/progress_video_state.dart';

class ProgressGridCell extends StatelessWidget {
  const ProgressGridCell(
      {super.key, required this.statusState, required this.status});

  final String? status;
  final ProcessedVideoState statusState;

  @override
  Widget build(BuildContext context) {
    switch (statusState) {
      case ProcessedVideoState.none:
        return const SizedBox();
      case ProcessedVideoState.error:
        return const Icon(
          Icons.error_outline,
          color: Colors.red,
        );
      case ProcessedVideoState.upload:
        return Icon(
          Icons.cloud_upload_outlined,
          color: Theme.of(context).primaryColor,
        );
      case ProcessedVideoState.save:
        return Icon(
          Icons.save_alt_outlined,
          color: Theme.of(context).primaryColor,
        );
      case ProcessedVideoState.compress:
        return Icon(
          Icons.compress_outlined,
          color: Theme.of(context).primaryColor,
        );
      case ProcessedVideoState.result:
        return Text(status!);
    }
  }
}
