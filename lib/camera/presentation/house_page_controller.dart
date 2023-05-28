import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/persistence/house_page_isar.dart';

import '../../di.dart';

class HousePageController {
  Ref _ref;

  HousePageController(this._ref);

  void loadFloorsFlats() {
    // TODO get the exact amount of floors and flats from the API
    // final floorsFlats = _ref.read(DI.api).
    // _ref.read(DI.housePageState).setFloorsFlats(floorsFlats);
  }

  void setFloor() {
    final location = _ref.read(DI.locationHistoryProvider).getLocation()!;
    _ref.read(DI.api).setFloor("${location.altitude}");
  }

  void dispose() {
    _ref.read(DI.storageProvider).save(HousePageIsar.fromHousePageState(
        _ref.read(DI.housePageState).getState()));
    _ref
        .read(DI.housePagesChangeNotifier)
        .update(_ref.read(DI.housePageState).getState());
  }
}
