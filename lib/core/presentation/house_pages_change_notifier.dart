import 'package:flutter/material.dart';

import '../../camera/presentation/house_page_state.dart';
import '../../models/house_model.dart';

class HousePagesChangeNotifier extends ChangeNotifier {
  List<HousePageState> _state = [];

  bool isEmpty() => _state.isEmpty;
  int length() => _state.length;

  HousePageState byIndex(int i) => _state[i];

  HousePageState? byHouseModel(HouseModel hm) {
    for (final s in _state) {
      if (s.house.sid == hm.sid) {
        return s;
      }
    }
    return null;
  }

  void add(HousePageState newState) {
    _state.add(newState);
    notifyListeners();
  }

  void setState(List<HousePageState> newState) {
    _state = newState;
    notifyListeners();
  }

  void update(HousePageState state) {
    for (final (i, s) in _state.indexed) {
      if (s.id == state.id) {
        _state[i] = state;
        notifyListeners();
        return;
      }
    }
  }

  List<HousePageState> getState() => _state;
}
