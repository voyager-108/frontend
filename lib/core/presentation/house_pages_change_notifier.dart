import 'package:flutter/material.dart';

import '../../camera/presentation/house_page_state.dart';

class HousePagesChangeNotifier extends ChangeNotifier {
  List<HousePageState> _state = [];

  bool isEmpty() => _state.isEmpty;
  int length() => _state.length;

  HousePageState byIndex(int i) => _state[i];

  void add(HousePageState newState) {
    _state.add(newState);
    notifyListeners();
  }

  void setState(List<HousePageState> newState) {
    _state = newState;
    notifyListeners();
  }

  List<HousePageState> getState() => _state;
}
