import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../camera/presentation/house_page_state.dart';
import '../../di.dart';

class MainPageController {
  MainPageController();

  void init(WidgetRef ref) async {
    await ref.read(DI.storageProvider).init();
    final data = await ref.read(DI.storageProvider).load();
    final state = data.map((e) => e.parseHousePageState()).toList();
    ref.read(DI.housePagesChangeNotifier).setState(state);
  }

  void setHouse(HousePageState state, WidgetRef ref) {
    ref.read(DI.housePageState).init(state);
  }
}
