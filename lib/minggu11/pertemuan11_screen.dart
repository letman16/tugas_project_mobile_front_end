import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu11/pertemuan11_provider.dart';

class Minggu11 extends StatefulWidget {
  const Minggu11({Key? key}) : super(key: key);

  @override
  _Minggu11State createState() => _Minggu11State();
}

class _Minggu11State extends State<Minggu11> {
  @override
  void initState() {
    Future.microtask(() {
      Provider.of<Minggu11Provider>(context, listen: false).initialData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minggu 11'),
        centerTitle: true,
        actions: [menuList(context)],
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    final prov = Provider.of<Minggu11Provider>(context);
    if (prov.data != null && prov.data.isNotEmpty) {
      return Container(
        color: Colors.amber,
        height: 610,
        child: ListView(
          children: List.generate(prov.data['data']!.length, (index) {
            var item = prov.data['data']![index];
            return InkWell(
              child: Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        item['Judul'],
                        style: TextStyle(
                          color: getRandomColor(),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        'Keterangan: ${item['Keterangan']}\nWaktu: ${item['Waktu']}\nTanggal: ${item['Tanggal']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      );
    } else {
      return Center(child: Text('Data tidak ditemukan'));
    }
  }

  Widget menuList(BuildContext context) {
    final prov = Provider.of<Minggu11Provider>(context);

    return PopupMenuButton(
      icon: Icon(Icons.more_vert),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry>[
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                prov.ubahList('Mendatang');
              },
              leading: const Icon(Icons.event),
              title: Text('Mendatang'),
            ),
          ),
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                prov.ubahList('Selesai');
              },
              leading: const Icon(Icons.check_circle),
              title: Text('Selesai'),
            ),
          ),
          PopupMenuDivider(),
          PopupMenuItem(
            child: ListTile(
              onTap: () {
                prov.clearPage();
              },
              leading: const Icon(Icons.delete),
              title: Text('Bersihkan'),
            ),
          ),
        ];
      },
    );
  }

  Color getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1.0,
    );
  }
}
