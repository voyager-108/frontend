import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../camera/presentation/house_page_state.dart';
import '../../di.dart';
import 'dart:developer' as dev;

import '../../models/house_model.dart';
import '../../models/house_progress_model.dart';

class HousePickingPageController {
  void init(WidgetRef ref) async {
    // make the location manager work by accessing it the first time
    ref.read(DI.locationManagerProvider);
    updatePermissionStatus(ref);
  }

  void updatePermissionStatus(WidgetRef ref) async {
    ref.read(DI.locationPermissionStatus.notifier).state =
        await Permission.location.status;
    dev.log("${ref.read(DI.locationPermissionStatus)}");
  }

  void getOptions(LocationData location, WidgetRef ref) async {
    // ref.invalidate(provider)
    // go to the API
    final api = ref.read(DI.api);
    final options = await api.getOptionsForLocation(location);
    ref.read(DI.availableHousesList.notifier).state = options;
  }

  void openHouse(WidgetRef ref, HouseModel e) {
    final possibleExistingOption =
        ref.read(DI.housePagesChangeNotifier).byHouseModel(e);
    if (possibleExistingOption == null) {
      final pageState = HousePageState.withHouse(e, HouseProgressModel());
      ref.read(DI.mainPageController).setHouse(pageState, ref);
      ref.read(DI.housePagesChangeNotifier).add(pageState);
    } else {
      ref.read(DI.mainPageController).setHouse(possibleExistingOption, ref);
    }
  }
}
