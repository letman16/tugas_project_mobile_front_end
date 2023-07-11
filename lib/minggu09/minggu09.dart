import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu09/minggu09_provider.dart';
import 'package:tugas_kelompok/minggu09/open_email.dart';

class Minggu09 extends StatefulWidget {
  const Minggu09({Key? key}) : super(key: key);

  @override
  State<Minggu09> createState() => _Minggu09State();
}

class _Minggu09State extends State<Minggu09> {
  List<Map<String, dynamic>> _listemail = [];
  List<Map<String, dynamic>> _typeEmail = [];
  @override
  void initState() {
    super.initState();
    _listemail = Provider.of<Minggu09Provider>(context, listen: false)
        .listEmail
        .where((email) => email['kategori_email']
            .toString()
            .toLowerCase()
            .contains('Kontak Masuk'.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu09Provider>(context);
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("Navigation Drawer, Tabs bar, Sheets Button"),
              centerTitle: true,
              bottom: const TabBar(isScrollable: true, tabs: [
                Tab(
                  child: Text("Mail"),
                ),
                Tab(
                  child: Text("Video Call"),
                ),
              ])),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                    padding: const EdgeInsets.all(16.0),
                    decoration: const BoxDecoration(color: Colors.blue),
                    child: Row(
                      children: [
                        CircleAvatar(
                          child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/0/04/ChatGPT_logo.svg/1024px-ChatGPT_logo.svg.png"),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Joen Doe",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "joen@mail.com",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                const Divider(),
                ListTile(
                  onTap: () {
                    prov.setTypeEmail = "Kontak Masuk";
                    setState(() {
                      _listemail = prov.listEmail
                          .where((email) => email['kategori_email']
                              .toString()
                              .toLowerCase()
                              .contains(prov.typeEmail.toLowerCase()))
                          .toList();
                    });
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.inbox),
                  title: Text(
                    "Kontak Masuk",
                    style: TextStyle(
                        color: prov.typeEmail == 'Kontak Masuk'
                            ? Colors.blue
                            : Colors.black),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                ),
                ListTile(
                  onTap: () {
                    prov.setTypeEmail = "Spam";
                    setState(() {
                      _listemail = prov.listEmail
                          .where((email) => email['kategori_email']
                              .toString()
                              .toLowerCase()
                              .contains(prov.typeEmail.toLowerCase()))
                          .toList();
                    });
                    Navigator.pop(context);
                  },
                  leading: const Icon(Icons.vaccines),
                  title: Text(
                    "Spam",
                    style: TextStyle(
                        color: prov.typeEmail == 'Spam'
                            ? Colors.blue
                            : Colors.black),
                  ),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                ),
                ListTile(
                  onTap: () {
                    Navigator.pop(context);
                    dialogInfo(context);
                  },
                  leading: const Icon(Icons.info),
                  title: const Text("Info"),
                  trailing: const Icon(Icons.keyboard_arrow_right_outlined),
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            ListView(
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      prov.typeEmail,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                Column(
                  children: _listemail.asMap().entries.map((entry) {
                    var index = entry.key;
                    var data = entry.value;
                    String nama_pengirim = data['nama_pengirim'];
                    return Column(
                      children: [
                        ListTile(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    OpenEmail(idEmail: data['id_email']),
                              ),
                            );
                          },
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.abc,
                              color: Colors.black,
                            ),
                          ),
                          title: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(nama_pengirim),
                                Text(data['title_email']),
                                Text(data['body_email'])
                              ],
                            ),
                          ),
                          trailing: Column(
                            children: [
                              Text(data['tanggal_email']),
                              const SizedBox(
                                height: 4,
                              ),
                              TextButton(
                                  onPressed: () {
                                    print(1);
                                  },
                                  child: data['star']
                                      ? const Icon(Icons.star)
                                      : const Icon(Icons.star_border))
                            ],
                          ),
                        ),
                        const Divider()
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Rapat",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      shareRapat(context),
                      ElevatedButton(
                          onPressed: () {},
                          child: const Text("Gabung pakai kode"))
                    ],
                  ),
                )
              ],
            ),
          ]),
        ));
  }

  Future<void> dialogInfo(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: const Text(
            'Ini adalah Aplikasi Gmail Palsu',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  shareRapat(BuildContext context) {
    return Builder(builder: ((context) {
      return ElevatedButton(
        onPressed: () {
          showBottomSheet(
              context: context,
              builder: (context) {
                final theme = Theme.of(context);
                return Wrap(children: [
                  ListTile(
                    title: const Text(
                      "Share Link rapat untuk dibagikan",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white),
                    ),
                    tileColor: theme.colorScheme.primary,
                    trailing: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: const Text("WhatsApp"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: const Text("Facebook"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: const Text("Instagram"),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    title: const Text("Telegram"),
                  ),
                ]);
              });
        },
        child: const Center(
          child: Text("Rapat baru"),
        ),
      );
    }));
  }
}
