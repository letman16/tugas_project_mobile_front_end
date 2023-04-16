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
      backgroundColor: const Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 156, 81)),
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        title: const Text(
          "Minggu 5",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "Filtering Data",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 28),
            ),
            const Divider(
              height: 30,
              color: Colors.transparent,
            ),
            const Text("Tipe Barang"),
            const Divider(
              height: 10,
              color: Colors.transparent,
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: prov.show_type ? 50 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: prov.show_type ? 1 : 0,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: prov.AvailableOption[0],
                              groupValue: prov.CurrentOption,
                              onChanged: (val) {
                                setState(() {
                                  prov.setCurrentOption = val.toString();
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
                                  prov.setCurrentOption = val.toString();
                                });
                              }),
                          const Text("Minuman")
                        ],
                      )
                    ]),
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
            const Text("Filter"),
            SingleChildScrollView(
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
            ? AnimatedOpacity(
                opacity: prov.show_filter ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Row(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("< rp 20.000"),
                                  Text("< rp 70.000"),
                                  Text("< rp 70.000"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
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
            ? AnimatedOpacity(
                opacity: prov.show_filter ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Row(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("<50"),
                                  Text("<100"),
                                  Text("<100"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
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
            ? AnimatedOpacity(
                opacity: prov.show_filter ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Row(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text("<3"),
                                  Text("<6"),
                                  Text("<10"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
            : Container());
  }
}

class MenuItem extends StatefulWidget {
  int harga = 0;
  String nama = "";
  int rating = 0;
  int pembeli = 0;
  MenuItem(
      {super.key,
      required this.harga,
      required this.nama,
      required this.rating,
      required this.pembeli});

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  bool _showdetails = false;
  @override
  Widget build(BuildContext context) {
    String hargaformat = "Rp ${widget.harga.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (match) => '${match[1]}.',
        )}";
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.fastfood),
          title: Text(widget.nama),
          trailing: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          onTap: () {
            setState(() {
              _showdetails = !_showdetails;
            });
          },
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: _showdetails ? 50 : 0,
          child: AnimatedOpacity(
            opacity: _showdetails ? 1 : 0,
            duration: const Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Text("Rating : "),
                    Text(widget.rating.toString())
                  ],
                ),
                Row(
                  children: [const Text("Harga : "), Text(hargaformat)],
                ),
                Row(
                  children: [
                    const Text("Pembeli : "),
                    Text(widget.pembeli.toString())
                  ],
                ),
              ],
            ),
          ),
        )
      ],
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
          harga: e["harga"],
          nama: e["nama"],
          rating: e["rating"],
          pembeli: e["pembeli"]);
    }).toList());
  }
}
