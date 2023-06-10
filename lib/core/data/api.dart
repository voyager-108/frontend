import 'dart:io';
import 'package:location/location.dart';
import 'package:dio/dio.dart';

import '../../models/house_model.dart';

class API {
  final dio = Dio(BaseOptions(baseUrl: 'http://voyager108.ru:8000'));
  String? session;
  // final embeddings = List<String>.empty(growable: true);
  // final yoloResults = List<String>.empty(growable: true);

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

  Future<int?> uploadVideo(File video, List<LocationData> locations,
      {isLast = false}) async {
    final formData = FormData.fromMap({
      "video": await MultipartFile.fromFile(video.path),
      "final": true,
      "locations": locations
          .map((e) => {
                "latitude": e.latitude,
                "longitude": e.longitude,
                "accuracy": e.accuracy,
                "altitude": e.altitude,
              })
          .toList(growable: false)
    });
    final response = await dio.post("/api/process-video", data: formData);
    final stats = response.data["stats"];
    return (double.parse("${stats['final_score'] * 100}")).toInt();
    // return Future.delayed(const Duration(seconds: 5), () => 50);
    // if (session == null) {
    //   // this is the first video to be sent
    //   final formData =
    //       FormData.fromMap({"video": await MultipartFile.fromFile(video.path)});
    //   final response = await dio.post("/api/process-video", data: formData);
    //   session = response.data['session'];
    // } else if (isLast) {
    //   // this is the last video in this session
    //   final formData = FormData.fromMap({
    //     "video": await MultipartFile.fromFile(video.path),
    //     "session": session,
    //     "final": true
    //   });
    //   final response = await dio.post("/api/process-video", data: formData);
    //   session = null;
    //   final stats = response.data["stats"];
    //   return (double.parse("${stats['final_score'] * 100}")).toInt();
    // } else {
    //   // just a regular video sent to the server
    //   final formData = FormData.fromMap({
    //     "video": await MultipartFile.fromFile(video.path),
    //     "session": session
    //   });
    //   dio.post("/api/process-video", data: formData);
    // }
    // return null;
  }
}
