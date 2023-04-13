import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu06/minggu06_provider.dart';

class Minggu06 extends StatefulWidget {
  const Minggu06({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Minggu06State createState() => _Minggu06State();
}

class _Minggu06State extends State<Minggu06> {
  // List Items Dropdown
  String itemSelectedWifi = "Tidak Terhubung";
  List itemsWifi = ["Tidak Terhubung", "Mikroskil", "Wifi Gratis", "Wifi ABC"];

  String itemSelectedDataSelular = "-";
  List itemsDataSelular = ["-", "SIM 1", "SIM 2", "Mode Pesawat"];

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu06Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Swicth dan Dropdown Button'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Mode Pesawat"),
                Switch(
                    value: prov.enableModePesawat,
                    activeColor: Colors.green,
                    onChanged: (val) {
                      prov.setModePesawat = val;
                      if (prov.enableModePesawat) {
                        setState(() {
                          itemSelectedDataSelular = "Mode Pesawat";
                          prov.setHotspotPribadi = false;
                        });
                      } else {
                        setState(() {
                          itemSelectedDataSelular = "-";
                        });
                      }
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Wi-Fi"),
                DropdownButton(
                    items: itemsWifi.map((itemWifi) {
                      return DropdownMenuItem(
                          value: itemWifi, child: Text(itemWifi));
                    }).toList(),
                    value: itemSelectedWifi,
                    onChanged: (val) {
                      setState(() {
                        itemSelectedWifi = val as String;
                      });
                    })
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Data Seluler"),
                DropdownButton(
                  items: itemsDataSelular.map((itemDataSelular) {
                    return DropdownMenuItem(
                        value: itemDataSelular, child: Text(itemDataSelular));
                  }).toList(),
                  value: itemSelectedDataSelular,
                  onChanged: prov.enableModePesawat
                      ? null
                      : (val) {
                          setState(() {
                            itemSelectedDataSelular = val as String;
                          });
                        },
                  disabledHint: Text(itemSelectedDataSelular),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Hotspot Pribadi"),
                Switch(
                    value: prov.enableHotspotPribadi,
                    activeColor: Colors.green,
                    onChanged: prov.enableModePesawat
                        ? null
                        : (val) {
                            if (itemSelectedDataSelular == "-" ||
                                itemSelectedDataSelular == "Mode Pesawat") {
                              print(
                                  "Hotspot Pribadi tidak bisa diaktifkan ketika Data Seluler belum dipilih atau dalam keadaan Mode Pesawat");
                            } else {
                              prov.setHotspotPribadi = val;
                            }
                          }),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(children: [
                  const Text("Info Konektifikas"),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Mode Pesawat"),
                        Text(prov.enableModePesawat ? "Aktif" : "Tidak aktif")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [const Text("Wi-Fi"), Text(itemSelectedWifi)],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Data Seluler"),
                        Text(itemSelectedDataSelular)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Hotspot Pribadi"),
                        Text(
                            prov.enableHotspotPribadi ? "Aktif" : "Tidak aktif")
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
          const Divider(),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    );
  }
}
