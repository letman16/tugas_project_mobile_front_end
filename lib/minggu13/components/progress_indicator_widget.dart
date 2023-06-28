import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu13/minggu13_provider.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu13Provider>(context);
    return ElevatedButton(
      onPressed: () {
        if (prov.sliderUkuranFontValue.round() == 0) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Kesalahan'),
              content: const Text('Tingkat kecerahan tidak boleh 0%.'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        } else {
          prov.mulaiProses(prov.sliderUkuranFontValue.round());
        }
      },
      child: prov.sedangProses
          ? TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: 1),
              duration: Duration(seconds: prov.sliderUkuranFontValue.round()),
              builder: (context, double value, _) => Stack(
                alignment: Alignment.center,
                children: [
                  LinearProgressIndicator(
                    backgroundColor: Colors.deepPurple,
                    color: Colors.red,
                    minHeight: 10,
                    // the valueColor property takes the preference
                    // over color property
                    valueColor: const AlwaysStoppedAnimation(Colors.green),
                    value: value,
                  ),
                  SizedBox(
                    width: 100,
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration:
                          Duration(seconds: prov.sliderUkuranFontValue.round()),
                      builder: (context, double value, _) => Text(
                        '${(value * prov.sliderUkuranFontValue).toInt() + 1} detik',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
            )
          : const Text("Terapkan"),
    );
  }
}
