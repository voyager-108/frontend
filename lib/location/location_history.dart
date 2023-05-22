import 'package:location/location.dart';

class LocationHistory {
  final _history = List<LocationData>.empty(growable: true);

  List<LocationData> get() => _history;

  void add(LocationData data) {
    _history.add(data);
  }
}
