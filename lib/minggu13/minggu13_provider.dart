import 'package:flutter/material.dart';

class Minggu13Provider extends ChangeNotifier {
  double _sliderKecerahanLayarValue = 0;
  double get sliderKecerahanLayarValue => _sliderKecerahanLayarValue;

  set setSliderKecerahanLayarValue(double val) {
    _sliderKecerahanLayarValue = val;
    notifyListeners();
  }

  double _sliderUkuranFontValue = 0;
  double get sliderUkuranFontValue => _sliderUkuranFontValue;

  set setSliderUkuranFontValue(double val) {
    _sliderUkuranFontValue = val;
    notifyListeners();
  }

  Color get backgroundBodyColor {
    if (_sliderKecerahanLayarValue.round() == 0) {
      return Colors.black.withOpacity(1.0);
    } else {
      double opacity = 1.0 - (_sliderKecerahanLayarValue / 10);
      return Colors.black.withOpacity(opacity.clamp(0.0, 1.0));
    }
  }

  bool _sedangProses = false;
  bool get sedangProses => _sedangProses;

  set setSedangProses(val) {
    _sedangProses = val;
    notifyListeners();
  }

  bool _selesaiProses = false;
  bool get selesaiProses => _selesaiProses;
  set setSelesaiProses(val) {
    _selesaiProses = val;
  }

  mulaiProses(int val) async {
    setSedangProses = true;
    Future.delayed(Duration(seconds: val), () {
      setSedangProses = false;
      setSelesaiProses = true;
    });
  }
}
