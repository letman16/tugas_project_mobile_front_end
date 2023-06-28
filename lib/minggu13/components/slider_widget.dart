import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu13/minggu13_provider.dart';

class SlideBrighnessWidget extends StatelessWidget {
  const SlideBrighnessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu13Provider>(context);
    return Column(
      children: [
        Tooltip(
          message: 'Slider Value: ${prov.sliderKecerahanLayarValue.round()}',
          child: Slider(
            value: prov.sliderKecerahanLayarValue,
            min: 0,
            max: 10,
            onChanged: (value) {
              prov.setSliderKecerahanLayarValue = value;
            },
          ),
        )
      ],
    );
  }
}

class SlideUkuranFontWidget extends StatelessWidget {
  const SlideUkuranFontWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu13Provider>(context);
    return Column(
      children: [
        Tooltip(
          message: 'Slider Value: ${prov.sliderUkuranFontValue.round()}',
          child: Slider(
            value: prov.sliderUkuranFontValue,
            min: 0,
            max: 10,
            onChanged: (value) {
              prov.setSliderUkuranFontValue = value;
            },
          ),
        )
      ],
    );
  }
}
