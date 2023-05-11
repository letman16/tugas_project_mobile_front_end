import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class Minggu03 extends StatefulWidget {
  const Minggu03({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _Minggu03State createState() => _Minggu03State();
}

class _Minggu03State extends State<Minggu03> {
  String itemSelectedKategori = "Pilih Kategori";
  List itemsKategori = ["Pilih Kategori", "Debit", "Kredit"];

  TextEditingController namaTransaksi = TextEditingController();
  TextEditingController jumlahTransaksi = TextEditingController();
  TextEditingController tanggalTransaksi = TextEditingController();

  List<Map<String, String>> transaksi = [];

  bool? validNamaTransaksi;
  bool? validJumlahTransaksi;
  bool? validTanggalTransaksi;
  bool? validKategoriTransaksi;

  @override
  void initState() {
    namaTransaksi.text = "";
    jumlahTransaksi.text = "";
    // format the current date as a string
    String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    tanggalTransaksi.text = formattedDate;

    validNamaTransaksi = true;
    validJumlahTransaksi = true;
    validTanggalTransaksi = true;
    validKategoriTransaksi = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Komponen Button dan TextFields'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Nama Transaksi"),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: TextField(
                      controller: namaTransaksi,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Masukkan Nama Transaksi',
                          errorText: validNamaTransaksi == true
                              ? null
                              : 'Nama Transaksi harus diisi'),
                    ))
                  ]),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Jumlah Transaksi"),
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                        child: TextField(
                      controller: jumlahTransaksi,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Masukkan Jumlah Transaksi',
                          errorText: validJumlahTransaksi == true
                              ? null
                              : 'Jumlah Transaksi harus diisi'),
                    ))
                  ]),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Tanggal Transaksi"),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                            child: TextField(
                          controller: tanggalTransaksi,
                          decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: 'Masukkan Tanggal Transaksi',
                              errorText: validTanggalTransaksi == true
                                  ? null
                                  : 'Tanggal Transaksi harus diisi'),
                        ))
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [Text("Format Tanggal: yyyy-MM-dd")],
                    ),
                  )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Kategori Transaksi"),
                        const SizedBox(
                          width: 12,
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: validKategoriTransaksi == false
                                ? Border.all(color: Colors.red)
                                : null,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: DropdownButton(
                            items: itemsKategori.map((itemKategori) {
                              return DropdownMenuItem(
                                  value: itemKategori, child: Text(itemKategori));
                            }).toList(),
                            value: itemSelectedKategori,
                            onChanged: (val) {
                              setState(() {
                                itemSelectedKategori = val as String;
                              });
                            },
                            disabledHint: Text(itemSelectedKategori),
                          ),
                        ),
                      ]),
                  if (validKategoriTransaksi == false)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Kategori Transaksi harus dipilih",
                          style: TextStyle(color: Colors.red, fontSize: 12),
                        )
                      ],
                    )
                ],
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (namaTransaksi.text.isEmpty) {
                          setState(() {
                            validNamaTransaksi = false;
                          });
                        } else {
                          setState(() {
                            validNamaTransaksi = true;
                          });
                        }
                        if (jumlahTransaksi.text.isEmpty) {
                          setState(() {
                            validJumlahTransaksi = false;
                          });
                        } else {
                          setState(() {
                            validJumlahTransaksi = true;
                          });
                        }
      
                        if (tanggalTransaksi.text.isEmpty) {
                          setState(() {
                            validTanggalTransaksi = false;
                          });
                        } else {
                          setState(() {
                            validTanggalTransaksi = true;
                          });
                        }
      
                        if (itemSelectedKategori == "Pilih Kategori") {
                          setState(() {
                            validKategoriTransaksi = false;
                          });
                        } else {
                          setState(() {
                            validKategoriTransaksi = true;
                          });
                        }
      
                        if (validNamaTransaksi == true &&
                            validJumlahTransaksi == true &&
                            validTanggalTransaksi == true &&
                            validKategoriTransaksi == true) {
                          setState(() {
                            validNamaTransaksi == true;
                            validJumlahTransaksi == true;
                            validTanggalTransaksi == true;
                            validKategoriTransaksi == true;
      
                            transaksi.add({
                              "nama_transaksi": namaTransaksi.text,
                              "jumlah_transaksi": jumlahTransaksi.text,
                              "tanggal_transaksi": tanggalTransaksi.text,
                              "kategori_transaksi": itemSelectedKategori
                            });
                          });
                          namaTransaksi.text = "";
                          jumlahTransaksi.text = "";
                          // format the current date as a string
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(DateTime.now());
                          tanggalTransaksi.text = formattedDate;
                          itemSelectedKategori = "Pilih Kategori";
                        }
                      },
                      child: const Text("Simpan"))
                ],
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    "Transaksi Komponen Button dan TextFields",
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Divider(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DataTable(
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Nama Transaksi',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Jumlah',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Tanggal',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Kategori',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: transaksi.map<DataRow>((data) {
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Center(
                                child: Text(
                                  data['nama_transaksi']!,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text(
                                  data['jumlah_transaksi']!,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text(
                                  data['tanggal_transaksi']!,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text(
                                  data['kategori_transaksi']!,
                                  style:
                                      const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
