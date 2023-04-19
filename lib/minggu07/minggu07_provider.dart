import 'package:flutter/material.dart';

class Minggu07Provider extends ChangeNotifier {
  List<Map<String, dynamic>> _teman = [
    {'name': 'Zhang Wei', 'gender': 'male', 'close_freind': true},
    {'name': 'Haruka Nakamura', 'gender': 'female', 'close_freind': false},
    {'name': 'Kim Min-ji', 'gender': 'female', 'close_freind': false},
    {'name': 'Rajesh Patel', 'gender': 'male', 'close_freind': false},
    {'name': 'Nurul Hasanah', 'gender': 'female', 'close_freind': true},
    {'name': 'Muhammad Rahman', 'gender': 'male', 'close_freind': false},
    {'name': 'Nurul Azizah', 'gender': 'female', 'close_freind': false},
    {'name': 'Nguyen Van Minh', 'gender': 'male', 'close_freind': false},
    {'name': 'Riza Sari', 'gender': 'female', 'close_freind': false},
    {'name': 'Ahmad Al-Saidi', 'gender': 'male', 'close_freind': true}
  ];

  String _inputNama = "";
  bool _enablebutton = false;

  List<Map<String, dynamic>> get teman => _teman;

  String get inputNama => _inputNama;
  bool get enablebutton => _enablebutton;

  set setteman(val) {
    _teman = val;
    notifyListeners();
  }

  set setenablebutton(val) {
    _enablebutton = val;
    notifyListeners();
  }

  set setinputNama(val) {
    _inputNama = val;
    notifyListeners();
  }

  set settambahteman(Map<String, dynamic> val) {
    _teman.add(val);
    notifyListeners();
  }

  set setdelete(String val) {
    _teman.removeWhere((item) => item['name'] == val);
    notifyListeners();
  }

  set setclosefreind(String val) {
    for (int i = 0; i < _teman.length; i++) {
      if (_teman[i]["name"] == val) {
        _teman[i]["close_freind"] = !_teman[i]["close_freind"];
      }
    }
    notifyListeners();
  }
}
