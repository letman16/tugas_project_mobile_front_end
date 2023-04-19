import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu07/minggu07_provider.dart';

import '../minggu01/minggu01.dart';
import '../minggu02/minggu02.dart';
import '../minggu03/minggu03.dart';
import '../minggu05/minggu05.dart';
import '../minggu06/minggu06.dart';

class Minggu07 extends StatefulWidget {
  const Minggu07({super.key});

  @override
  State<Minggu07> createState() => _Minggu07State();
}

class _Minggu07State extends State<Minggu07> {
  @override
  TextEditingController NameController = TextEditingController();
  TextEditingController SearchController = TextEditingController();

  String Search = "";

  int _CurrentIndex = 0;

  String SelectGender = "";

  bool _addnama = false;

  Widget bodywidget(BuildContext context) {
    final prov = Provider.of<Minggu07Provider>(context);
    if (_CurrentIndex == 0) {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: prov.teman.map((e) => MyFreindCard(Person: e)).toList(),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: SearchController,
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(), label: Text("Nama")),
              onChanged: (val) {
                setState(() {
                  Search = val;
                });
              },
            ),
            Column(
              children: prov.teman
                  .map((e) => MyFreindCard_filter(Person: e, Keyword: Search))
                  .toList(),
            )
          ],
        ),
      );
    }
  }

  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu07Provider>(context);

    const addSnackBar = SnackBar(
      content: const Text("Berhasil menambahkan teman"),
      duration: Duration(milliseconds: 500),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Minggu 07"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("arah"),
                        content: Row(
                          children: [
                            SizedBox(
                              width: 10,
                              height: 10,
                              child: Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.green)),
                            ),
                            const Text(" : Close Freind")
                          ],
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Okay'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(Icons.question_mark)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              title: const Text("Minggu01"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Minggu01();
                }));
              },
            ),
            ListTile(
              title: const Text("Minggu02"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Minggu02();
                }));
              },
            ),
            ListTile(
              title: const Text("Minggu03"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Minggu03();
                }));
              },
            ),
            ListTile(title: const Text("Minggu04"), onTap: null),
            ListTile(
              title: const Text("Minggu05"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Minggu5();
                }));
              },
            ),
            ListTile(
              title: const Text("Minggu06"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Minggu06();
                }));
              },
            ),
            ListTile(
              title: const Text("Minggu07"),
              selected: true,
              selectedTileColor: Colors.amber,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
      body: bodywidget(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        visible: _CurrentIndex == 0 ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  int selectedRadio = 0;
                  return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return AlertDialog(
                        title: const Text("Tambah Teman"),
                        content:
                            Column(mainAxisSize: MainAxisSize.min, children: [
                          TextField(
                            controller: NameController,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(),
                              label: Text("Nama"),
                            ),
                            onChanged: (value) {
                              prov.setinputNama = value;
                              prov.setenablebutton =
                                  prov.inputNama.isEmpty ? false : true;
                              setState(
                                () {},
                              );
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Radio(
                                      value: 0,
                                      groupValue: selectedRadio,
                                      onChanged: (int? val) {
                                        setState(() => selectedRadio = val!);
                                      }),
                                  const Text("Male")
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: 1,
                                      groupValue: selectedRadio,
                                      onChanged: (int? val) {
                                        setState(() => selectedRadio = val!);
                                      }),
                                  const Text("Female")
                                ],
                              ),
                            ],
                          )
                        ]),
                        actions: [
                          OutlinedButton(
                              onPressed: () {
                                NameController.text = "";
                                prov.setinputNama = "";
                                prov.setenablebutton = false;
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel")),
                          ElevatedButton(
                              onPressed: prov.enablebutton
                                  ? () {
                                      if (selectedRadio == 1)
                                        SelectGender = "female";
                                      if (selectedRadio == 0)
                                        SelectGender = "male";
                                      prov.settambahteman = {
                                        "name": NameController.text,
                                        "gender": SelectGender,
                                        "close_freind": false
                                      };
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(addSnackBar);
                                      prov.setinputNama = "";
                                      NameController.text = "";
                                      prov.setenablebutton = false;
                                      Navigator.of(context).pop();
                                    }
                                  : null,
                              child: const Text("Save")),
                        ],
                      );
                    },
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _CurrentIndex,
        onTap: (idx) {
          setState(() {
            _CurrentIndex = idx;
          });
        },
        items: [
          const BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          const BottomNavigationBarItem(
              label: "Search", icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}

class MyFreindCard extends StatelessWidget {
  Map<String, dynamic> Person;
  MyFreindCard({super.key, required this.Person});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu07Provider>(context);
    bool _male;
    if (Person["gender"] == "male") {
      _male = true;
    } else {
      _male = false;
    }
    const deleteSnackBar = SnackBar(
      content: const Text("Berhasil menghapus"),
      duration: Duration(milliseconds: 500),
    );
    SnackBar favsnackbar(String name, bool status) {
      return SnackBar(
        content: Text(
            "Berhasil ${status ? "menghapus" : "menambahkan"} ${name} sebagai teman dekat"),
        duration: Duration(milliseconds: 500),
      );
    }

    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
              color:
                  Person["close_freind"] ? Colors.green.shade400 : Colors.grey,
              width: 2.0),
        ),
        child: ListTile(
          leading: _male ? const Icon(Icons.male) : const Icon(Icons.female),
          title: Text(Person["name"]),
          tileColor:
              Person["close_freind"] ? Colors.green.shade200 : Colors.grey[200],
          trailing: PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text("Delete"),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(deleteSnackBar);
                  prov.setdelete = Person["name"];
                },
              ),
              PopupMenuItem(
                child: Person["close_freind"]
                    ? const Text("Remove Close Freind")
                    : const Text("Add Close Freind"),
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      favsnackbar(Person["name"], Person["close_freind"]));
                  prov.setclosefreind = Person["name"];
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyFreindCard_filter extends StatelessWidget {
  Map<String, dynamic> Person;
  String Keyword;
  MyFreindCard_filter({super.key, required this.Person, required this.Keyword});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu07Provider>(context);
    if (Keyword != "") {
      if (Person["name"].toLowerCase().contains(Keyword)) {
        return MyFreindCard(Person: Person);
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
}
