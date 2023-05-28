import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class LocationHistory extends ChangeNotifier {
  final _history = List<LocationData>.empty(growable: true);
  bool _isRecording = false;

  LocationData? getLocation() => _history.isEmpty ? null : _history[0];

  void startRecording() {
    _isRecording = true;
  }

  List<LocationData> stopRecording() {
    _isRecording = false;
    final h = List<LocationData>.from(_history);
    _history.clear();
    return h;
  }

  void add(LocationData data) {
    if (_isRecording || _history.isEmpty) {
      _history.add(data);
    } else {
      _history[0] = data;
    }
    notifyListeners();
  }
}
