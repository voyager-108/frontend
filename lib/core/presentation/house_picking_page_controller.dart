import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../camera/presentation/house_page_state.dart';
import '../../di.dart';
import 'dart:developer' as dev;

import '../../models/house_model.dart';
import '../../models/house_progress_model.dart';

class HousePickingPageController {
  final Ref _ref;

  HousePickingPageController(this._ref);

  void init() async {
    updatePermissionStatus();
  }

  void updatePermissionStatus() async {
    _ref.read(DI.locationPermissionStatus.notifier).state =
        await Permission.location.status;
    _ref.read(DI.locationManagerProvider).init(_ref);
    dev.log("${_ref.read(DI.locationPermissionStatus)}");
  }

  void getOptions(LocationData location) async {
    final api = _ref.read(DI.api);
    try {
      final options = await api.getOptionsForLocation(location);
      _ref.read(DI.availableHousesList.notifier).state = options;
    } catch (e) {
      dev.log("Couldn't load the data $e");
    }
  }

  void openHouse(HouseModel e) {
    final possibleExistingOption =
        _ref.read(DI.housePagesChangeNotifier).byHouseModel(e);
    if (possibleExistingOption != null) {
      _ref
          .read(DI.mainPageController)
          .setHouse(possibleExistingOption, true, false);
      return;
    }
    final pageState = HousePageState(e, HouseProgressModel());
    final index = _ref.read(DI.housePagesChangeNotifier).add(pageState);
    _ref.read(DI.mainPageController).setHouse(index, false, true);
  }
}
