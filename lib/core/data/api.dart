import 'package:location/location.dart';

import '../../models/house_model.dart';

class API {
  Future<List<HouseModel>> getOptionsForLocation(LocationData location) async {
    return Future.delayed(const Duration(seconds: 3), () {
      return [];
    });
  }
  // Future<FloorProgressModel> uploadVideo() async {}

  // Future<void>
}
