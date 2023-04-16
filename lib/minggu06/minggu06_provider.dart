import 'package:flutter/material.dart';

class Minggu06Provider extends ChangeNotifier {
  bool _enableModePesawat = false;

  bool get enableModePesawat => _enableModePesawat;

  set setModePesawat(val) {
    _enableModePesawat = val;
    notifyListeners();
  }

  bool _enableHotspotPribadi = false;

  bool get enableHotspotPribadi => _enableHotspotPribadi;

  set setHotspotPribadi(val) {
    _enableHotspotPribadi = val;
    notifyListeners();
  }
}
