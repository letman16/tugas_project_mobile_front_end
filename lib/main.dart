import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:tugas_kelompok/blank_screen.dart';

import 'package:tugas_kelompok/minggu01/minggu01.dart';
import 'package:tugas_kelompok/minggu02/minggu02.dart';
import 'package:tugas_kelompok/minggu03/minggu03.dart';

import 'package:tugas_kelompok/minggu04/minggu04.dart';
import 'package:tugas_kelompok/minggu04/minggu04_provider.dart';

import 'package:tugas_kelompok/minggu05/minggu05.dart';
import 'package:tugas_kelompok/minggu05/minggu05_provider.dart';

import 'package:tugas_kelompok/minggu06/minggu06.dart';
import 'package:tugas_kelompok/minggu06/minggu06_provider.dart';

import 'package:tugas_kelompok/minggu07/minggu07.dart';
import 'package:tugas_kelompok/minggu07/minggu07_provider.dart';
import 'package:tugas_kelompok/minggu10/minggu10.dart';
import 'package:tugas_kelompok/minggu12/minggu12_card.dart';
import 'package:tugas_kelompok/minggu12/minggu12_provider.dart';
import 'package:tugas_kelompok/minggu14/minggu14.dart';

import 'minggu10/page.dart';

import 'minggu11/pertemuan11_screen.dart';
import 'minggu11/pertemuan11_provider.dart';

import 'package:tugas_kelompok/minggu13/minggu13.dart';
import 'package:tugas_kelompok/minggu13/minggu13_provider.dart';

import 'minggu14/minggu14_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => Minggu04Provider()),
    ChangeNotifierProvider(create: (_) => Minggu05Provider()),
    ChangeNotifierProvider(create: (_) => Minggu06Provider()),
    ChangeNotifierProvider(create: (_) => Minggu07Provider()),
    ChangeNotifierProvider(create: (_) => Minggu10Provider()),
    ChangeNotifierProvider(create: (_) => Minggu11Provider()),
    ChangeNotifierProvider(create: (_) => Minggu12Provider()),
    ChangeNotifierProvider(create: (_) => Minggu13Provider()),
    ChangeNotifierProvider(create: (_) => Minggu14Provider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Tugas Kelompok 8 sebelum UTS';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const TableTugasKelompok(),
      ),
    );
  }
}

class TableTugasKelompok extends StatelessWidget {
  const TableTugasKelompok({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tableData = [
      {
        'minggu': '1',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu01();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.red,
          ),
          child: const Text(
            'Pengenalan Flutter',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '2',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu02();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.orange,
          ),
          child: const Text(
            'Layout',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '3',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu03();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
          ),
          child: const Text(
            'Komponen Button dan TextFields',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '4',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu04();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.green,
          ),
          child: const Text(
            'Komponen State dan Provider',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '5',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu5();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.blue,
          ),
          child: const Text(
            'Komponen Checkbox, Radio Button, dan Chips',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '6',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu06();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.red,
          ),
          child: const Text(
            'Komponen Swicth dan Dropdown Button',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '7',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu07();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
          ),
          child: const Text(
            'Komponen App Bar, Fab, Bottom Navigation',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '10',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu10();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
          ),
          child: const Text(
            'Banner, Dialog, Snackbar',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '11',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu11();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.purple,
          ),
          child: const Text(
            'Menus, List, dan Dividers',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '12',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return Minggu12();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.pink.shade100,
          ),
          child: const Text(
            'Cards, dan ListTiles',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '13',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu13();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
          ),
          child: const Text(
            'Slider, Tooltips, progress Indicator',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
      {
        'minggu': '14',
        'materi': ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const Minggu14();
            }));
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.yellow,
          ),
          child: const Text(
            'Date Picker, Time Picker',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  const Text(
                    "Kelompok 8",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Anggota Kelompok:"),
                          SizedBox(height: 5),
                          Text("1. 211110217 Jikky"),
                          Text("2. 211111578 Lukman Hakim"),
                          Text("3. 211112299 Bobby Boris Febrian Bakara"),
                          Text("4. 211112562 M. Aulia Kahfim")
                        ]),
                  )
                ],
              ),
            ),
            DataTable(
              columns: const <DataColumn>[
                DataColumn(
                  label: Text(
                    'Minggu',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Materi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
              rows: tableData.map<DataRow>((data) {
                return DataRow(
                  cells: <DataCell>[
                    DataCell(
                      Center(
                        child: Text(
                          data['minggu'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    DataCell(
                      SizedBox(
                        width: double.infinity,
                        child: data['materi'],
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
