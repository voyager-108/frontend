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
    final house = _ref.read(DI.housePageState).getState()?.house;
    if (house == null) return;
    if (!(_ref.read(DI.housePageState).isNew ?? false)) return;
    final location = _ref.read(DI.locationHistoryProvider).getLocation()!;
    _ref.read(DI.api).setFloor("${location.altitude}");
  }

  Future<void> dispose() async {
    final s = _ref.read(DI.housePageState).getState();
    if (s == null) return;
    if (_ref.read(DI.housePageState).isNew ?? false) {
      final newId = await _ref
          .read(DI.storageProvider)
          .save(HousePageIsar.fromHousePageState(s));
      if (newId != null) {
        _ref.read(DI.housePageState).setStateId(newId);
      }
    } else {
      _ref.read(DI.storageProvider).save(HousePageIsar.fromHousePageState(s));
    }
  }
}
