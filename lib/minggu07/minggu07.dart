import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu07/minggu07_provider.dart';

class Minggu07 extends StatefulWidget {
  const Minggu07({super.key});



  @override
  State<Minggu07> createState() => _Minggu07State();
}

class _Minggu07State extends State<Minggu07> {
  @override
  String val1 = "hai";
  String val2 = "halo";
  String now = "Hola";

  TextEditingController NameController = TextEditingController();
  TextEditingController SearchController = TextEditingController();

  String add = "add";
  String delete = "delete";
  String selected = "anu";

  String Search = "";

  int _CurrentIndex = 0;

  String SelectGender = "";

  Widget bodywidget(BuildContext context) {
    final prov = Provider.of<Minggu07Provider>(context);
    if (_CurrentIndex == 0) {
      return SingleChildScrollView(
        child: Column(
          children: prov.teman.map((e) => MyFreindCard(Person: e)).toList(),
        ),
      );
    } else {
      return Column(
        children: [
          TextField(
            controller: SearchController,
            decoration: InputDecoration(
                border: UnderlineInputBorder(), hintText: "Nama"),
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
      );
    }
  }

  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu07Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minggu 05"),
        centerTitle: true,
        leading: PopupMenuButton(
          itemBuilder: (context) => [
            PopupMenuItem(
              child: const Text("hai"),
              value: val1,
            ),
            PopupMenuItem(
              child: const Text("halo"),
              value: val2,
            )
          ],
          onSelected: (value) => setState(() {
            now = value;
          }),
        ),
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
      body: bodywidget(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                int selectedRadio = -1;
                return AlertDialog(
                  title: const Text("Tambah Teman"),
                  content: StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return Column(mainAxisSize: MainAxisSize.min, children: [
                        TextField(
                          controller: NameController,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(), hintText: "Nama"),
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
                                Text("Male")
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
                                Text("Female")
                              ],
                            ),
                          ],
                        )
                      ]);
                    },
                  ),
                  actions: [
                    OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text("Cancel")),
                    ElevatedButton(
                        onPressed: () {
                          if (selectedRadio == 1) SelectGender = "female";
                          if (selectedRadio == 0) SelectGender = "male";
                          prov.settambahteman = {
                            "name": NameController.text,
                            "gender": SelectGender,
                            "close_freind": false
                          };
                          NameController.text = "";
                          Navigator.of(context).pop();
                        },
                        child: const Text("Save")),
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
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

    return ListTile(
      leading: _male ? const Icon(Icons.male) : const Icon(Icons.female),
      title: Text(Person["name"],
          style: TextStyle(
              color: Person["close_freind"] ? Colors.green : Colors.black)),
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Text("Delete"),
            onTap: () {
              prov.setdelete = Person["name"];
            },
          ),
          PopupMenuItem(
            child: Person["close_freind"]
                ? Text("Remove Close Freind")
                : Text("Add Close Freind"),
            onTap: () {
              prov.setclosefreind = Person["name"];
            },
          ),
        ],
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
