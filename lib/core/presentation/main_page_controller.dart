import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/models/house_model.dart';
import 'package:frontend/models/house_progress_model.dart';

import '../../camera/presentation/house_page_state.dart';
import '../../di.dart';
import '../../persistence/storage.dart';
import 'dart:developer' as dev;

class MainPageController {
  final Storage storage;
  MainPageController(this.storage);

  void init(WidgetRef ref) async {
    final data = await storage.load();
    final state = data.map((e) => e.parseHousePageState()).toList();
    ref.read(DI.housePagesChangeNotifier).setState(state);
  }

  void setHouse(HousePageState state, WidgetRef ref) {
    ref.read(DI.housePageState).init(state);
  }

  void createTestHouse(WidgetRef ref) {
    final newHouse = HousePageState.withHouse(
        HouseModel.withFlat(
            [FloorModel(1, 9), FloorModel(2, 9), FloorModel(3, 8)]),
        HouseProgressModel());
    ref.read(DI.housePagesChangeNotifier).add(newHouse);
  }
}
