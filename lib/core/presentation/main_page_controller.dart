import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../di.dart';

class MainPageController {
  final Ref _ref;
  MainPageController(this._ref);

  void init() async {
    await _ref.read(DI.storageProvider).init();
    final data = await _ref.read(DI.storageProvider).load();
    final state = data.map((e) => e.parseHousePageState()).toList();
    _ref.read(DI.housePagesChangeNotifier).setState(state);
    // make the location manager work by accessing it the first time
    _ref.read(DI.locationManagerProvider);
    // make the accelerometer controller work
    _ref.read(DI.accelerometerControllerProvider);
  }

  void setHouse(int index, bool floorsFlatsSet, bool isNew) {
    _ref.read(DI.housePageState).init(index, floorsFlatsSet, isNew);
  }
}
