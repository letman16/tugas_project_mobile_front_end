import 'package:flutter/material.dart';
import 'package:tugas_kelompok/minggu05/minggu05_provider.dart';
import 'package:provider/provider.dart';

class Minggu5 extends StatefulWidget {
  const Minggu5({super.key});

  @override
  State<Minggu5> createState() => _Minggu5State();
}

class _Minggu5State extends State<Minggu5> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu05Provider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Minggu 5",
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Filtering Data",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
            ),
            const Divider(
              height: 30,
              color: Colors.transparent,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Tipe Barang"),
                const SizedBox(
                  width: 10,
                ),
                Chip(
                  label: Text(
                    prov.CurrentOption,
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.grey[200],
                )
              ],
            ),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
            AnimatedContainer(
              alignment: Alignment.center,
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.grey.shade400)),
              duration: const Duration(milliseconds: 500),
              width: prov.show_type ? MediaQuery.of(context).size.width : 20,
              height: prov.show_type ? 50 : 0,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: AnimatedSize(
                  duration: Duration(milliseconds: 500),
                  child: prov.show_type
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              Row(
                                children: [
                                  Radio(
                                      value: prov.AvailableOption[0],
                                      groupValue: prov.CurrentOption,
                                      onChanged: (val) {
                                        setState(() {
                                          prov.setCurrentOption =
                                              val.toString();
                                        });
                                      }),
                                  const Text("Makanan")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: prov.AvailableOption[1],
                                      groupValue: prov.CurrentOption,
                                      onChanged: (val) {
                                        setState(() {
                                          prov.setCurrentOption =
                                              val.toString();
                                        });
                                      }),
                                  const Text("Minuman")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: prov.AvailableOption[2],
                                      groupValue: prov.CurrentOption,
                                      onChanged: (val) {
                                        setState(() {
                                          prov.setCurrentOption =
                                              val.toString();
                                        });
                                      }),
                                  const Text("Semua")
                                ],
                              )
                            ])
                      : Container(),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    prov.setshow_type = !prov.show_type;
                  });
                },
                child: prov.show_type
                    ? const Icon(Icons.arrow_upward)
                    : const Icon(Icons.arrow_downward)),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
            OverflowBar(
              overflowAlignment: OverflowBarAlignment.center,
              overflowSpacing: 5,
              spacing: 5,
              children: [
                const Text("Filter"),
                if (prov.show_filter_harga)
                  ChoiceChip(
                    label: Text(
                      "Harga : ${prov.captharga()}",
                      style: TextStyle(color: Colors.black),
                    ),
                    selected: true,
                    selectedColor: Colors.grey[200],
                    onSelected: (value) {
                      prov.setshow_filter_harga = value;
                    },
                  ),
                if (prov.show_filter_pembeli)
                  ChoiceChip(
                    label: Text(
                      "Pembeli : ${prov.captpembeli()}",
                      style: TextStyle(color: Colors.black),
                    ),
                    selected: true,
                    selectedColor: Colors.grey[200],
                    onSelected: (value) {
                      prov.setshow_filter_pembeli = value;
                    },
                  ),
                if (prov.show_filter_rating)
                  ChoiceChip(
                    label: Text(
                      "Rating : ${prov.captrating()}",
                      style: TextStyle(color: Colors.black),
                    ),
                    selected: true,
                    selectedColor: Colors.grey[200],
                    onSelected: (value) {
                      prov.setshow_filter_rating = value;
                    },
                  ),
              ],
            ),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              margin: const EdgeInsetsDirectional.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(color: Colors.grey.shade400)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: const [
                  FilterHarga(),
                  SizedBox(
                    width: 10,
                  ),
                  FilterPembeli(),
                  SizedBox(
                    width: 10,
                  ),
                  FilterRating(),
                ]),
              ),
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    prov.setshow_filter = !prov.show_filter;
                  });
                },
                child: prov.show_filter
                    ? const Icon(Icons.arrow_upward)
                    : const Icon(Icons.arrow_downward)),
            const ShowItem()
          ],
        ),
      ),
    );
  }
}

class FilterHarga extends StatefulWidget {
  const FilterHarga({super.key});

  @override
  State<FilterHarga> createState() => _FilterHargaState();
}

class _FilterHargaState extends State<FilterHarga> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu05Provider>(context);
    return AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: prov.show_filter
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: prov.show_filter_harga,
                              onChanged: (val) {
                                setState(() {
                                  prov.setshow_filter_harga = val!;
                                });
                              }),
                          const SizedBox(width: 5),
                          const Text("Harga")
                        ],
                      ),
                      SizedBox(
                        width: 170,
                        height: 100,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                    value: prov.filter_harga[0],
                                    groupValue: prov.Current_harga,
                                    onChanged: prov.show_filter_harga
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_harga =
                                                  prov.filter_harga[0];
                                            });
                                          }
                                        : null),
                                Radio(
                                    value: prov.filter_harga[1],
                                    groupValue: prov.Current_harga,
                                    onChanged: prov.show_filter_harga
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_harga =
                                                  prov.filter_harga[1];
                                            });
                                          }
                                        : null),
                                Radio(
                                    value: prov.filter_harga[2],
                                    groupValue: prov.Current_harga,
                                    onChanged: prov.show_filter_harga
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_harga =
                                                  prov.filter_harga[2];
                                            });
                                          }
                                        : null),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("rp 0 - rp 20.000"),
                                Text("rp 20.001 - rp 70.000"),
                                Text("> rp 70.000"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Container());
  }
}

class FilterPembeli extends StatefulWidget {
  const FilterPembeli({super.key});

  @override
  State<FilterPembeli> createState() => _FilterPembeliState();
}

class _FilterPembeliState extends State<FilterPembeli> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu05Provider>(context);
    return AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: prov.show_filter
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: prov.show_filter_pembeli,
                              onChanged: (val) {
                                setState(() {
                                  prov.setshow_filter_pembeli = val!;
                                });
                              }),
                          const SizedBox(width: 5),
                          const Text("Pembeli")
                        ],
                      ),
                      SizedBox(
                        width: 170,
                        height: 100,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                    value: prov.filter_pembeli[0],
                                    groupValue: prov.Current_pembeli,
                                    onChanged: prov.show_filter_pembeli
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_pembeli =
                                                  prov.filter_pembeli[0];
                                            });
                                          }
                                        : null),
                                Radio(
                                    value: prov.filter_pembeli[1],
                                    groupValue: prov.Current_pembeli,
                                    onChanged: prov.show_filter_pembeli
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_pembeli =
                                                  prov.filter_pembeli[1];
                                            });
                                          }
                                        : null),
                                Radio(
                                    value: prov.filter_pembeli[2],
                                    groupValue: prov.Current_pembeli,
                                    onChanged: prov.show_filter_pembeli
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_pembeli =
                                                  prov.filter_pembeli[2];
                                            });
                                          }
                                        : null),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("0 - 50"),
                                Text("51 - 100"),
                                Text("> 100"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Container());
  }
}

class FilterRating extends StatefulWidget {
  const FilterRating({super.key});

  @override
  State<FilterRating> createState() => _FilterRatingState();
}

class _FilterRatingState extends State<FilterRating> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu05Provider>(context);
    return AnimatedSize(
        duration: const Duration(milliseconds: 500),
        child: prov.show_filter
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: prov.show_filter_rating,
                              onChanged: (val) {
                                setState(() {
                                  prov.setshow_filter_rating = val!;
                                });
                              }),
                          const SizedBox(width: 5),
                          const Text("Rating")
                        ],
                      ),
                      SizedBox(
                        width: 170,
                        height: 100,
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Radio(
                                    value: prov.filter_rating[0],
                                    groupValue: prov.Current_rating,
                                    onChanged: prov.show_filter_rating
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_rating =
                                                  prov.filter_rating[0];
                                            });
                                          }
                                        : null),
                                Radio(
                                    value: prov.filter_rating[1],
                                    groupValue: prov.Current_rating,
                                    onChanged: prov.show_filter_rating
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_rating =
                                                  prov.filter_rating[1];
                                            });
                                          }
                                        : null),
                                Radio(
                                    value: prov.filter_rating[2],
                                    groupValue: prov.Current_rating,
                                    onChanged: prov.show_filter_rating
                                        ? (val) {
                                            setState(() {
                                              prov.setCurrent_rating =
                                                  prov.filter_rating[2];
                                            });
                                          }
                                        : null),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text("0 - 3"),
                                Text("3,01 - 6"),
                                Text("> 6"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            : Container());
  }
}

class MenuItem extends StatefulWidget {
  int harga = 0;
  String nama = "";
  int rating = 0;
  int pembeli = 0;
  int idx = 0;
  MenuItem(
      {super.key,
      required this.harga,
      required this.nama,
      required this.rating,
      required this.pembeli,
      required this.idx});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  final addsnackbar = const SnackBar(
    content: Text("Coming soon"),
    duration: Duration(milliseconds: 500),
  );
  @override
  Widget build(BuildContext context) {
    String hargaformat = "Rp ${widget.harga.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        )}";
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      margin: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          color: Colors.green.shade200,
          border: Border.all(color: Colors.green.shade400)),
      child: Column(
        children: [
          ListTile(
              leading: const Icon(Icons.fastfood),
              title: Text("${widget.idx}. ${widget.nama}"),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Rating : ${widget.rating}"),
                  Text("Harga : ${widget.harga}"),
                  Text("Sold : ${widget.pembeli}")
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(addsnackbar);
                },
              ),
              onTap: null),
        ],
      ),
    );
  }
}

class ShowItem extends StatefulWidget {
  const ShowItem({super.key});

  @override
  State<ShowItem> createState() => _ShowItemState();
}

class _ShowItemState extends State<ShowItem> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu05Provider>(context);
    return Column(
        children: prov.data_filter_done.map((e) {
      return MenuItem(
          idx: e["idx"],
          harga: e["harga"],
          nama: e["nama"],
          rating: e["rating"],
          pembeli: e["pembeli"]);
    }).toList());
  }
}
