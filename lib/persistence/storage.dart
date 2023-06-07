import 'package:frontend/persistence/house_page_isar.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:developer' as dev;

class Storage {
  Isar? isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HousePageIsarSchema],
      directory: dir.path,
    );
  }

  Future<List<HousePageIsar>> load() async {
    if (isar == null) return [];
    return await isar!.txn(
        () async => await isar!.collection<HousePageIsar>().where().findAll());
  }

  Future<int?> save(HousePageIsar s) async {
    if (isar == null) return null;
    dev.log("STATE ID: ${s.id}");
    int? newId;
    await isar!.writeTxn(() async {
      newId = await isar!.collection<HousePageIsar>().put(s);
      dev.log("NEW ID STORED: $newId");
    });
    return newId;
  }
}
