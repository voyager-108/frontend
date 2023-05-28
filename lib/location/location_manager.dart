import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'dart:developer' as dev;

import '../../di.dart';

class LocationManager {
  final _location = Location();
  bool _enabled = false;
  PermissionStatus? _permissionGranted;

  LocationManager(Ref ref) {
    init(ref);
  }

  void init(Ref ref) async {
    dev.log("Initializing the location manager");
    _enabled = await _location.serviceEnabled();
    if (!_enabled) {
      _enabled = await _location.requestService();
      if (!_enabled) {
        dev.log("Couldn't await for the _location.requestService()");
        return;
      }
    }
    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        dev.log("Couldn't await for the _location.requestPermission()");
        return;
      }
    }
    _location.onLocationChanged.listen((event) {
      ref.read(DI.locationHistoryProvider).add(event);
      dev.log("LAT ${event.latitude}; LON ${event.longitude}");
    });
  }
}
