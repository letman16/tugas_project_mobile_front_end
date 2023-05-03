import 'package:flutter/widgets.dart';

class Minggu04Provider extends ChangeNotifier {
  List<Map<String, dynamic>> _datakayu = [
    {"expanded": false, "id": 1, "nama": "Jati", "jumlah": 20},
    {"expanded": false, "id": 2, "nama": "Merbau", "jumlah": 4},
    {"expanded": false, "id": 3, "nama": "Mahoni", "jumlah": 12},
    {"expanded": false, "id": 4, "nama": "Kayu Cendana", "jumlah": 10},
    {"expanded": false, "id": 5, "nama": "Kapur", "jumlah": 0},
    {"expanded": false, "id": 6, "nama": "Bengkirai", "jumlah": 7},
    {"expanded": false, "id": 7, "nama": "Sonokeling", "jumlah": 6},
    {"expanded": false, "id": 8, "nama": "Kelapa", "jumlah": 5},
    {"expanded": false, "id": 9, "nama": "Pinus", "jumlah": 4},
    {"expanded": false, "id": 10, "nama": "Sengon", "jumlah": 3},
    {"expanded": false, "id": 11, "nama": "Akasia", "jumlah": 2},
    {"expanded": false, "id": 12, "nama": "Kamper", "jumlah": 1},
  ];
  List<String> _history = [];
  int _selected = -1;
  bool _temp = false;
  String _keyword = "";

  bool get temp => _temp;
  String get keyword => _keyword;
  int get selected => _selected;
  List<Map<String, dynamic>> get datakayu => _datakayu;
  List<String> get history => _history;

  set setselected(val) {
    _selected = val;
    notifyListeners();
  }

  void settemp() {
    _temp = !temp;
    notifyListeners();
  }

  set setdatakayu(val) {
    _datakayu = val;
    notifyListeners();
  }

  set addhistory(val) {
    _history.add(val);
    notifyListeners();
  }

  void clearhistory() {
    _history.clear();
    notifyListeners();
  }

  void doadditem(String nama, int count) {
    for (int i = 0; i < _datakayu.length; i++) {
      if (_datakayu[i]["nama"] == nama) _datakayu[i]["jumlah"] += count;
      notifyListeners();
    }
  }

  void dotakeitem(String nama, int count) {
    for (int i = 0; i < _datakayu.length; i++) {
      if (_datakayu[i]["nama"] == nama) _datakayu[i]["jumlah"] -= count;
      notifyListeners();
    }
  }

  void expanditem(String nama) {
    for (int i = 0; i < _datakayu.length; i++) {
      if (_datakayu[i]["nama"] != nama) {
        _datakayu[i]["expanded"] = false;
      } else {
        _datakayu[i]["expanded"] = !_datakayu[i]["expanded"];
      }
    }
    notifyListeners();
  }
}
