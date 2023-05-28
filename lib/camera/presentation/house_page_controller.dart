import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/persistence/house_page_isar.dart';

import '../../di.dart';

class HousePageController {
  void dispose(WidgetRef ref) {
    ref.read(DI.storageProvider).save(HousePageIsar.fromHousePageState(
        ref.read(DI.housePageState).getState()));
    ref
        .read(DI.housePagesChangeNotifier)
        .update(ref.read(DI.housePageState).getState());
  }
}
