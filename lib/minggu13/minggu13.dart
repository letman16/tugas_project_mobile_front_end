import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu13/minggu13_provider.dart';
import 'package:tugas_kelompok/minggu13/components/slider_widget.dart';
import 'package:tugas_kelompok/minggu13/components/progress_indicator_widget.dart';
import 'package:tugas_kelompok/minggu13/components/content_widget.dart';

class Minggu13 extends StatefulWidget {
  const Minggu13({Key? key}) : super(key: key);

  @override
  State<Minggu13> createState() => _Minggu13State();
}

class _Minggu13State extends State<Minggu13> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu13Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pertemuan 13"),
        centerTitle: true,
      ),
      backgroundColor: prov.sedangProses
          ? prov.selesaiProses
              ? prov.backgroundBodyColor
              : prov.backgroundBodyColor
          : prov.backgroundBodyColor,
      // prov.sedangProses
      //     ? Colors.black.withOpacity(0.0)
      //     : prov.selesaiProses
      //         ? prov.backgroundBodyColor
      //         : Colors.black.withOpacity(0.0),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tingkat Kecerahan: ${prov.sliderKecerahanLayarValue.round().toString()}',
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SlideBrighnessWidget(),
            const Divider(),
            Text(
              'Ukuran Font: ${prov.sliderUkuranFontValue.round().toString()}',
              style: const TextStyle(
                  color: Colors.blue, fontWeight: FontWeight.bold),
            ),
            const SlideUkuranFontWidget(),
            const Align(
              alignment: Alignment.bottomRight,
              child: ProgressIndicatorWidget(),
            ),
            const SizedBox(
              height: 100,
            ),
            const ContentWidget()
          ],
        ),
      ),
    );
  }
}
