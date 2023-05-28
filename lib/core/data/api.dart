import 'dart:convert';
import 'package:location/location.dart';
import 'package:dio/dio.dart';

import '../../models/house_model.dart';

class API {
  final dio = Dio(BaseOptions(baseUrl: 'http://178.170.197.93:8080'));
  // final dio = Dio(BaseOptions(baseUrl: 'http://voyager108.ru:7080'));
  // http://voyager108.ru:7080/docs
  // static const base = "http://178.170.197.93:8080/api/";

  Future<List<HouseModel>> getOptionsForLocation(LocationData location) async {
    final res = await dio.post("/api/location-section", data: {
      'coordinates': [location.latitude!, location.longitude!]
    });
    final houseModelList = List<HouseModel>.empty(growable: true);
    Map<String, dynamic> data = json.decode(res.data);
    Map<String, dynamic> section = json.decode(data["section"]);
    final String slug = section["slug"];
    final List<Map<String, dynamic>> buildings =
        json.decode(section["buildings"]);
    for (final b in buildings) {
      final int pk = b["pk"];
      final String name = b["name"];
      final List<Map<String, dynamic>> sections = json.decode(b["sections"]);
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
    final res = await dio
        .post("/api/select-section", data: {'slug': slug, 'pk': pk, 'id': sid});
    return [];
  }

  void setFloor(String altitude) {
    dio.post("/api/calculate-floor", data: {'altitude': altitude});
  }

  // Future<FloorProgressModel> uploadVideo(
  //     File video, List<LocationData> locations) async {
  //   final formData = FormData.fromMap({
  //     "video": await MultipartFile.fromFile(video.path),
  //     "locations": locations
  //         .map((e) =>
  //             {"lat": e.latitude, "lon": e.longitude, "altitude": e.altitude})
  //         .toList()
  //   });
  //   final res = await dio.post("/api/upload-video", data: formData);
  //   Map<String, dynamic> data = json.decode(res.data);
  //   Map<String, dynamic> stats = json.decode(data["stats"]);
  //   stats["final_score"]
  // }
}
