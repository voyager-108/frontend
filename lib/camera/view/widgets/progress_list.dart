import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/camera/view/widgets/progress_grid_cell.dart';
import 'package:frontend/core/presentation/progress_view_type.dart';

import '../../../di.dart';

class ProgressList extends ConsumerStatefulWidget {
  const ProgressList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProgressListState();
}

class _ProgressListState extends ConsumerState {
  static const cellHeight = 64.0;

  @override
  void initState() {
    if (ref.read(DI.progressViewType) == ProgressViewType.grid) {
      Future.delayed(const Duration(milliseconds: 500), () {
        ref.read(DI.gridScrollController).animateTo(
            ref.read(DI.gridScrollController).position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(DI.progressViewType) == ProgressViewType.list) {
      return Expanded(
        child: ListView.builder(
            itemCount: ref.watch(DI.housePageState).progressLength(),
            itemBuilder: (context, index) {
              final state =
                  ref.watch(DI.housePageState).progressElement(index)!;
              return ListTile(
                title: Text(
                    "Этаж ${state.floorNumber}, квартира ${state.flatNumber}"),
                subtitle: state.status == null ? null : Text(state.status!),
              );
            }),
      );
    }
    // ProgressViewType.grid
    final gridData = ref.watch(DI.housePageState).formProgressGrid();
    final columns = gridData[0].length;
    final rows = gridData.length;
    final verticalSize = gridData.length * cellHeight;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: SizedBox(
          height: verticalSize,
          child: GridView.count(
            childAspectRatio: (MediaQuery.of(context).size.width - 32) /
                gridData[0].length /
                cellHeight,
            controller: ref.read(DI.gridScrollController),
            crossAxisCount: columns,
            children: List.generate(
                columns * rows,
                (index) => Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black12,
                            strokeAlign: BorderSide.strokeAlignOutside)),
                    height: cellHeight,
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ProgressGridCell(
                        status: gridData[index ~/ columns][index % columns].one,
                        statusState:
                            gridData[index ~/ columns][index % columns].two,
                      ),
                    ))),
          ),
        ),
      ),
    );
  }
}
