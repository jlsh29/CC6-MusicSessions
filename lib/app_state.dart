import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  List<ScheduleStruct> _schedule = [];
  List<ScheduleStruct> get schedule => _schedule;
  set schedule(List<ScheduleStruct> _value) {
    _schedule = _value;
  }

  void addToSchedule(ScheduleStruct _value) {
    _schedule.add(_value);
  }

  void removeFromSchedule(ScheduleStruct _value) {
    _schedule.remove(_value);
  }

  void removeAtIndexFromSchedule(int _index) {
    _schedule.removeAt(_index);
  }

  void updateScheduleAtIndex(
    int _index,
    ScheduleStruct Function(ScheduleStruct) updateFn,
  ) {
    _schedule[_index] = updateFn(_schedule[_index]);
  }

  void insertAtIndexInSchedule(int _index, ScheduleStruct _value) {
    _schedule.insert(_index, _value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
