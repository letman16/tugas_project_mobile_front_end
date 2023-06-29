import 'package:flutter/material.dart';

class Minggu10Provider extends ChangeNotifier{
  dynamic _data = [
    {
      'judul': 'Shape of You',
      'favorit': true,
    },
    {
      'judul': 'Bohemian Rhapsody',
      'favorit': true,
    },
    {
      'judul': 'Despacito',
      'favorit': false,
    },
    {
      'judul': 'Someone Like You',
      'favorit': true,
    },
    {
      'judul': 'Uptown Funk',
      'favorit': true,
    },
  ];

  dynamic get data => _data;

  set setdata(val){
    _data = val;
    notifyListeners();
  }

  changefav(int idx){
    _data[idx]["favorit"] = !_data[idx]["favorit"]; 
    notifyListeners();
  }

  delete_data(int idx){
    _data.removeAt(idx);
    notifyListeners();
  }

  add_data(String judul, bool fav){
    _data.add(
      {
        "judul" : judul,
        "favorit" : fav
      }
    );
    notifyListeners();
  }

}