import 'dart:js_util';

import 'package:flutter/material.dart';

class Minggu05Provider extends ChangeNotifier {
  final List<Map<String, dynamic>> _data = [
    {
      "idx": 1,
      "nama": "Nasi Goreng",
      "jenis": "Makanan",
      "harga": 25000,
      "rating": 8,
      "pembeli": 100
    },
    {
      "idx": 2,
      "nama": "Ayam Geprek",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 9,
      "pembeli": 80
    },
    {
      "idx": 3,
      "nama": "Sate Ayam",
      "jenis": "Makanan",
      "harga": 30000,
      "rating": 3,
      "pembeli": 70
    },
    {
      "idx": 4,
      "nama": "Bakso",
      "jenis": "Makanan",
      "harga": 15000,
      "rating": 6,
      "pembeli": 120
    },
    {
      "idx": 5,
      "nama": "Mie Ayam",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 8,
      "pembeli": 90
    },
    {
      "idx": 6,
      "nama": "Soto Ayam",
      "jenis": "Makanan",
      "harga": 25000,
      "rating": 4,
      "pembeli": 60
    },
    {
      "idx": 7,
      "nama": "Nasi Uduk",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 8,
      "pembeli": 50
    },
    {
      "idx": 8,
      "nama": "Bubur Ayam",
      "jenis": "Makanan",
      "harga": 15000,
      "rating": 6,
      "pembeli": 80
    },
    {
      "idx": 9,
      "nama": "Es Teh Manis",
      "jenis": "Minuman",
      "harga": 5000,
      "rating": 7,
      "pembeli": 150
    },
    {
      "idx": 10,
      "nama": "Jus Alpukat",
      "jenis": "Minuman",
      "harga": 10000,
      "rating": 9,
      "pembeli": 70
    },
    {
      "idx": 11,
      "nama": "Kopi Hitam",
      "jenis": "Minuman",
      "harga": 8000,
      "rating": 2,
      "pembeli": 100
    },
    {
      "idx": 12,
      "nama": "Teh Tarik",
      "jenis": "Minuman",
      "harga": 6000,
      "rating": 7,
      "pembeli": 120
    },
    {
      "idx": 13,
      "nama": "Jus Jeruk",
      "jenis": "Minuman",
      "harga": 8000,
      "rating": 8,
      "pembeli": 90
    },
    {
      "idx": 14,
      "nama": "Coca Cola",
      "jenis": "Minuman",
      "harga": 10000,
      "rating": 6,
      "pembeli": 50
    },
    {
      "idx": 15,
      "nama": "Milo",
      "jenis": "Minuman",
      "harga": 9000,
      "rating": 7,
      "pembeli": 80
    },
    {
      "idx": 16,
      "nama": "Nasi Campur",
      "jenis": "Makanan",
      "harga": 30000,
      "rating": 5,
      "pembeli": 70
    },
    {
      "idx": 17,
      "nama": "Gado-Gado",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 7,
      "pembeli": 60
    },
    {
      "idx": 18,
      "nama": "Sate Kambing",
      "jenis": "Makanan",
      "harga": 35000,
      "rating": 9,
      "pembeli": 50
    },
    {
      "idx": 19,
      "nama": "Nasi Bakar",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 3,
      "pembeli": 30
    },
    {
      "idx": 20,
      "nama": "Tuak",
      "jenis": "Minuman",
      "harga": 10000,
      "rating": 10,
      "pembeli": 60
    },
  ];

  List<Map<String, dynamic>> _data_filter_done = [
    {
      "idx": 1,
      "nama": "Nasi Goreng",
      "jenis": "Makanan",
      "harga": 25000,
      "rating": 8,
      "pembeli": 100
    },
    {
      "idx": 2,
      "nama": "Ayam Geprek",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 9,
      "pembeli": 80
    },
    {
      "idx": 3,
      "nama": "Sate Ayam",
      "jenis": "Makanan",
      "harga": 30000,
      "rating": 3,
      "pembeli": 70
    },
    {
      "idx": 4,
      "nama": "Bakso",
      "jenis": "Makanan",
      "harga": 15000,
      "rating": 6,
      "pembeli": 120
    },
    {
      "idx": 5,
      "nama": "Mie Ayam",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 8,
      "pembeli": 90
    },
    {
      "idx": 6,
      "nama": "Soto Ayam",
      "jenis": "Makanan",
      "harga": 25000,
      "rating": 4,
      "pembeli": 60
    },
    {
      "idx": 7,
      "nama": "Nasi Uduk",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 8,
      "pembeli": 50
    },
    {
      "idx": 8,
      "nama": "Bubur Ayam",
      "jenis": "Makanan",
      "harga": 15000,
      "rating": 6,
      "pembeli": 80
    },
    {
      "idx": 9,
      "nama": "Es Teh Manis",
      "jenis": "Minuman",
      "harga": 5000,
      "rating": 7,
      "pembeli": 150
    },
    {
      "idx": 10,
      "nama": "Jus Alpukat",
      "jenis": "Minuman",
      "harga": 10000,
      "rating": 9,
      "pembeli": 70
    },
    {
      "idx": 11,
      "nama": "Kopi Hitam",
      "jenis": "Minuman",
      "harga": 8000,
      "rating": 2,
      "pembeli": 100
    },
    {
      "idx": 12,
      "nama": "Teh Tarik",
      "jenis": "Minuman",
      "harga": 6000,
      "rating": 7,
      "pembeli": 120
    },
    {
      "idx": 13,
      "nama": "Jus Jeruk",
      "jenis": "Minuman",
      "harga": 8000,
      "rating": 8,
      "pembeli": 90
    },
    {
      "idx": 14,
      "nama": "Coca Cola",
      "jenis": "Minuman",
      "harga": 10000,
      "rating": 6,
      "pembeli": 50
    },
    {
      "idx": 15,
      "nama": "Milo",
      "jenis": "Minuman",
      "harga": 9000,
      "rating": 7,
      "pembeli": 80
    },
    {
      "idx": 16,
      "nama": "Nasi Campur",
      "jenis": "Makanan",
      "harga": 30000,
      "rating": 5,
      "pembeli": 70
    },
    {
      "idx": 17,
      "nama": "Gado-Gado",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 7,
      "pembeli": 60
    },
    {
      "idx": 18,
      "nama": "Sate Kambing",
      "jenis": "Makanan",
      "harga": 35000,
      "rating": 9,
      "pembeli": 50
    },
    {
      "idx": 19,
      "nama": "Nasi Bakar",
      "jenis": "Makanan",
      "harga": 20000,
      "rating": 3,
      "pembeli": 30
    },
    {
      "idx": 20,
      "nama": "Tuak",
      "jenis": "Minuman",
      "harga": 10000,
      "rating": 10,
      "pembeli": 60
    },
  ];

  final List<String> _AvailableOption = ["Makanan", "Minuman", "Semua"];
  final List<int> _filter_harga = [20000, 70000, 1000000];
  final List<int> _filter_pembeli = [50, 100, 1000000];
  final List<int> _filter_rating = [3, 6, 1000000];

  String _CurrentOption = "Semua";
  int _Current_harga = 20000;
  int _Current_pembeli = 100;
  int _Current_rating = 1000000;

  bool _show_type = false;
  bool _show_filter = false;

  bool _show_filter_harga = false;
  bool _show_filter_rating = false;
  bool _show_filter_pembeli = false;

  //get

  List<Map<String, dynamic>> get data => _data;

  List<Map<String, dynamic>> get data_filter_done => _data_filter_done;

  List<String> get AvailableOption => _AvailableOption;
  List<int> get filter_harga => _filter_harga;
  List<int> get filter_pembeli => _filter_pembeli;
  List<int> get filter_rating => _filter_rating;

  String get CurrentOption => _CurrentOption;
  int get Current_harga => _Current_harga;
  int get Current_pembeli => _Current_pembeli;
  int get Current_rating => _Current_rating;

  bool get show_type => _show_type;
  bool get show_filter => _show_filter;

  bool get show_filter_harga => _show_filter_harga;
  bool get show_filter_rating => _show_filter_rating;
  bool get show_filter_pembeli => _show_filter_pembeli;

  //set

  set setdata_filter_done(val) {
    setdata_filter_done = val;
    notifyListeners();
  }

  set setCurrentOption(val) {
    _CurrentOption = val;
    notifyListeners();
    _set_item_to_show();
  }

  set setCurrent_harga(val) {
    _Current_harga = val;
    notifyListeners();
    _set_item_to_show();
  }

  set setCurrent_pembeli(val) {
    _Current_pembeli = val;
    notifyListeners();
    _set_item_to_show();
  }

  set setCurrent_rating(val) {
    _Current_rating = val;
    notifyListeners();
    _set_item_to_show();
  }

  set setshow_type(val) {
    _show_type = val;
    notifyListeners();
  }

  set setshow_filter(val) {
    _show_filter = val;
    notifyListeners();
  }

  set setshow_filter_harga(val) {
    _show_filter_harga = val;
    notifyListeners();
    _set_item_to_show();
  }

  set setshow_filter_rating(val) {
    _show_filter_rating = val;
    notifyListeners();
    _set_item_to_show();
  }

  set setshow_filter_pembeli(val) {
    _show_filter_pembeli = val;
    notifyListeners();
    _set_item_to_show();
  }

  void _set_item_to_show() {
    _data_filter_done.clear();
    for (int i = 0; i < data.length; i++) {
      bool statusitem = true;
      if (CurrentOption != "Semua") {
        if (data[i]["jenis"] != CurrentOption) {
          statusitem = false;
        }
      }
      if (statusitem && show_filter_harga) {
        if (Current_harga == 20000) {
          if (data[i]["harga"] > 20000) statusitem = false;
        } else if (Current_harga == 70000) {
          if (data[i]["harga"] <= 20000 || data[i]["harga"] > 70000) {
            statusitem = false;
          }
        } else if (Current_harga == 1000000) {
          if (data[i]["harga"] <= 70000) statusitem = false;
        }
      }
      if (statusitem && show_filter_rating) {
        if (Current_rating == 3) {
          if (data[i]["rating"] > 3) statusitem = false;
        } else if (Current_rating == 6) {
          if (data[i]["rating"] <= 3 || data[i]["rating"] > 6) {
            statusitem = false;
          }
        } else if (Current_rating == 1000000) {
          if (data[i]["rating"] <= 6) statusitem = false;
        }
      }
      if (statusitem && show_filter_pembeli) {
        if (Current_pembeli == 50) {
          if (data[i]["pembeli"] > 50) statusitem = false;
        } else if (Current_pembeli == 100) {
          if (data[i]["pembeli"] <= 50 || data[i]["pembeli"] > 100) {
            statusitem = false;
          }
        } else if (Current_pembeli == 1000000) {
          if (data[i]["pembeli"] <= 100) statusitem = false;
        }
      }
      if (statusitem) {
        _data_filter_done.add(data[i]);
      }
    }
    notifyListeners();
  }

  String captharga() {
    if (Current_harga == 20000) {
      return "rp 0 - rp 20.000";
    } else if (Current_harga == 70000) {
      return "rp 20.001 - rp 70.000";
    } else {
      return "> rp 70.000";
    }
  }

  String captpembeli() {
    if (Current_pembeli == 50) {
      return "0 - 50";
    } else if (Current_pembeli == 100) {
      return "51 - 100";
    } else {
      return "> 100";
    }
  }

  String captrating() {
    if (Current_rating == 3) {
      return "0 - 3";
    } else if (Current_rating == 6) {
      return "3,01 - 6";
    } else {
      return "> 6";
    }
  }
}
