import 'package:flutter/material.dart';
import 'package:tugas_kelompok/minggu14/form_box.dart';

class Minggu14Provider extends ChangeNotifier{
  dynamic _regularToDo = [
    {
      "ToDo" : "Belajar",
      "Date" : DateTime(2023, 8, 29),
      "Time" : TimeOfDay(hour: 20, minute: 0)
    },
    {
      "ToDo" : "Ujian",
      "Date" : DateTime(2023, 8, 30),
      "Time" : TimeOfDay(hour: 10, minute: 0)
    },
  ];

  dynamic _longRangeToDo = [
    {
      "ToDo" : "Benerin Kipas Angin",
      "Date" : DateTimeRange(start: DateTime.now(), end: DateTime(2023, 7, 29)),
      "Time" : TimeOfDay(hour: 20, minute: 0)
    },
    {
      "ToDo" : "Buat Meja",
      "Date" : DateTimeRange(start: DateTime(2023, 10, 15), end: DateTime(2023, 10, 20)),
      "Time" : TimeOfDay(hour: 18, minute: 0)
    }
  ];

  dynamic get regularToDo => _regularToDo;
  dynamic get longRangeToDo => _longRangeToDo;

  set setregularToDo(val) {
    _regularToDo.add(val);
    notifyListeners();
  }

  set setlongRangeToDo(val) {
    _longRangeToDo.add(val);
    notifyListeners();
  }


}