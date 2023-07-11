import 'package:carousel_slider/carousel_slider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu15/components/list_file_image.dart';
import 'minggu15_provider.dart';
import 'components/carousel_slider.dart';

class Minggu15 extends StatefulWidget {
  const Minggu15({super.key});

  @override
  State<Minggu15> createState() => _Minggu15State();
}

class _Minggu15State extends State<Minggu15> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu15Provider>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('ImagePicker, Carousel, Webview'),
        ),
        body: ListView(children: [
          Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "Update Status",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Image",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              var pilihGambar = ImagePicker();
                              var hasil = await pilihGambar.pickMultiImage();

                              // ignore: unnecessary_null_comparison
                              if (hasil != null) {
                                setState(() {
                                  prov.setListImg(hasil);
                                });
                              }
                            },
                            child: const Text("Pilih Images"))
                      ],
                    ),
                  ),
                  if (prov.listImg != null && prov.listImg!.isNotEmpty)
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const ListFileImage(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: prov.isPost
                                ? MainAxisAlignment.spaceBetween
                                : MainAxisAlignment.end,
                            children: [
                              if (prov.isPost)
                                ElevatedButton(
                                    onPressed: () {
                                      prov.ulangi();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.red,
                                    ),
                                    child: const Text(
                                      "Ulangi",
                                    )),
                              if (prov.isPost == false)
                                ElevatedButton(
                                    onPressed: () {
                                      prov.setPost = true;
                                    },
                                    child: const Text("Posting"))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    ),
                  if (prov.isPost)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(),
                        const SizedBox(
                          height: 10,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "user1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Carousel Slider
                        if (prov.listImg != null && prov.listImg!.isNotEmpty)
                          const Column(
                            children: [CarouselSliderWidget(), Divider()],
                          ),
                      ],
                    )
                ],
              )
            ],
          ),
        ]));
  }
}
