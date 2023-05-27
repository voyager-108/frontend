import 'package:frontend/persistence/house_page_isar.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../camera/presentation/house_page_state.dart';

class Storage {
  Isar? isar;

  Storage() {
    init();
  }

  void init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HousePageIsarSchema],
      directory: dir.path,
    );
  }

  Future<List<HousePageIsar>> load() async {
    if (isar == null) return [];
    return await isar!.collection<HousePageIsar>().where().findAll();
  }

  void save(HousePageIsar s) async {
    if (isar == null) return;
    await isar!.collection<HousePageIsar>().put(s);
  }
}
