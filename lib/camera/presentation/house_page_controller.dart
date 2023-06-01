import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/persistence/house_page_isar.dart';

import '../../di.dart';

class HousePageController {
  final Ref _ref;

  HousePageController(this._ref);

  void loadFloorsFlats() async {
    final house = _ref.read(DI.housePageState).getState()?.house;
    if (house == null) return;
    if (_ref.read(DI.housePageState).areFloorsFlatsSet) return;
    final floorsFlats = await _ref
        .read(DI.api)
        .getHouseFloorsFlats(house.slug, house.pk, house.sid);
    _ref.read(DI.housePageState).setFloorsFlats(floorsFlats);
  }

  void setFloor() {
    final location = _ref.read(DI.locationHistoryProvider).getLocation()!;
    _ref.read(DI.api).setFloor("${location.altitude}");
  }

  void dispose() {
    final s = _ref.read(DI.housePageState).getState();
    if (s == null) return;
    if (_ref.read(DI.housePageState).isNew ?? false) {
      _ref.read(DI.storageProvider).save(HousePageIsar.fromHousePageState(s));
    }
    _ref.read(DI.housePagesChangeNotifier).update(s);
  }
}
