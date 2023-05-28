import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../camera/presentation/house_page_state.dart';
import '../../di.dart';

class MainPageController {
  final Ref _ref;
  MainPageController(this._ref);

  void init() async {
    await _ref.read(DI.storageProvider).init();
    final data = await _ref.read(DI.storageProvider).load();
    final state = data.map((e) => e.parseHousePageState()).toList();
    _ref.read(DI.housePagesChangeNotifier).setState(state);
  }

  void setHouse(HousePageState state) {
    _ref.read(DI.housePageState).init(state);
  }
}
