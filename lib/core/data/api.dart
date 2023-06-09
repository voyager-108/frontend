import 'dart:io';
import 'package:location/location.dart';
import 'package:dio/dio.dart';

import '../../models/house_model.dart';

class API {
  final dio = Dio(BaseOptions(baseUrl: 'http://178.170.197.93:8080'));
  final mlDio = Dio(BaseOptions(baseUrl: 'http://178.170.197.93:7080'));
  final embeddings = List<String>.empty(growable: true);
  final yoloResults = List<String>.empty(growable: true);

  Future<List<HouseModel>> getOptionsForLocation(LocationData location) async {
    final res = await dio.post("/api/location-section", data: {
      'coordinates': [location.latitude!, location.longitude!]
    });
    final houseModelList = List<HouseModel>.empty(growable: true);
    final String slug = res.data["slug"];
    final buildings = res.data["buildings"];
    for (final k in buildings.keys) {
      final b = buildings[k];
      final int pk = b["pk"];
      final String name = b["name"];
      final sections = b["sections"];
      for (final s in sections) {
        final int sid = s["id"];
        final int number = s["number"];
        houseModelList.add(HouseModel.noFlat(pk, sid, slug, name, number));
      }
    }
    return houseModelList;
  }

  Future<List<FloorModel>> getHouseFloorsFlats(
      String slug, int pk, int sid) async {
    final res = await dio.post("/api/select-section", data: {
      'project_slug': slug,
      'building_pk': pk.toString(),
      'section_id': sid.toString()
    });
    final floors = res.data["floors"];
    final flats = res.data["flats"];
    return List.generate(floors, (index) => FloorModel(index + 1, flats));
  }

  void setFloor(String altitude) {
    dio.post("/api/calculate-floor", data: {'altitude': altitude});
  }

  // Future<int> uploadVideo(File video, {isFinal = false}) async {
  //
  // }

  Future<int?> uploadVideo(File video, {isLast = false}) async {
    return Future.delayed(const Duration(seconds: 2), () => 45);
    // final formData = isLast
    //     ? FormData.fromMap({
    //         "video": await MultipartFile.fromFile(video.path),
    //         "embeddings": embeddings,
    //         "yolo_results": yoloResults,
    //         "isLast": true
    //       })
    //     : FormData.fromMap({
    //         "video": await MultipartFile.fromFile(video.path),
    //       });
    // final res = await mlDio.post("/score-card/v2/video", data: formData);
    // if (isLast) {
    //   embeddings.clear();
    //   yoloResults.clear();
    //   Map<String, dynamic> stats = res.data["stats"];
    //   return (double.parse("${stats['final_score'] * 100}")).toInt();
    // } else {
    //   embeddings.add(res.data['embeddings']);
    //   yoloResults.add(res.data['yolo']);
    //   return null;
    // }
  }
}
