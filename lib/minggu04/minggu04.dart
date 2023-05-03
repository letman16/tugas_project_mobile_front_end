import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu04/historypage.dart';
import 'package:tugas_kelompok/minggu04/minggu04_provider.dart';

class Minggu04 extends StatefulWidget {
  const Minggu04({super.key});

  @override
  State<Minggu04> createState() => _Minggu04State();
}

class _Minggu04State extends State<Minggu04> {
  int _CurrentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu04Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minggu 04"),
        centerTitle: true,
      ),
      body: _CurrentIndex == 0 ? Home(data: prov.datakayu) : Search(),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HistoryPage()));
        },
        child: const Icon(Icons.history),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _CurrentIndex,
        onTap: (idx) {
          setState(() {
            _CurrentIndex = idx;
          });
        },
        items: const [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: "Search", icon: Icon(Icons.search)),
        ],
      ),
    );
  }
}

class CostumTile extends StatefulWidget {
  Map<String, dynamic> data;
  CostumTile({super.key, required this.data});

  @override
  State<CostumTile> createState() => _CostumTileState();
}

class _CostumTileState extends State<CostumTile> {
  int additem = 0;

  int takeitem = 0;

  int reqitem = 0;

  SnackBar successadd = const SnackBar(
    content: Text("Success add item"),
    duration: Duration(milliseconds: 900),
  );
  SnackBar successtake = const SnackBar(
    content: Text("Success take item"),
    duration: Duration(milliseconds: 900),
  );

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu04Provider>(context);
    Iterable<Map<String, dynamic>> mydata =
        prov.datakayu.where((e) => e["nama"] == widget.data["nama"]);
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: Colors.grey),
          color: widget.data["jumlah"] <= 3
              ? Colors.red.shade300
              : Colors.green.shade300),
      child: ExpansionTile(
        key: GlobalKey(),
        initiallyExpanded: mydata.elementAt(0)["expanded"],
        onExpansionChanged: (value) {
          prov.expanditem(widget.data["nama"]);
        },
        textColor: Colors.black,
        collapsedTextColor: Colors.black,
        leading: Text(widget.data["id"].toString()),
        trailing: Text("Jumlah : ${widget.data["jumlah"]}"),
        title: Text(widget.data["nama"]),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: additem == 0
                                ? null
                                : () {
                                    setState(() {
                                      additem--;
                                    });
                                  },
                            child: const Icon(Icons.remove)),
                        Text(
                          additem.toString(),
                          style: TextStyle(
                              color: additem == 0 ? Colors.grey : Colors.black),
                        ),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                additem++;
                              });
                            },
                            child: const Icon(Icons.add)),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: additem == 0
                            ? null
                            : () {
                                prov.doadditem(widget.data["nama"], additem);
                                prov.addhistory =
                                    "Success add ${additem} item to Kayu ${widget.data["nama"]}";
                                additem = 0;
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(successadd);
                              },
                        child: const Text("add")),
                  ],
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        TextButton(
                            onPressed: takeitem == 0
                                ? null
                                : () {
                                    setState(() {
                                      takeitem--;
                                    });
                                  },
                            child: const Icon(Icons.remove)),
                        Text(
                          takeitem.toString(),
                          style: TextStyle(
                              color:
                                  takeitem == 0 ? Colors.grey : Colors.black),
                        ),
                        TextButton(
                            onPressed: widget.data["jumlah"] == takeitem
                                ? null
                                : () {
                                    setState(() {
                                      takeitem++;
                                    });
                                  },
                            child: const Icon(Icons.add)),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: widget.data["jumlah"] == 0
                            ? null
                            : takeitem == 0
                                ? null
                                : () {
                                    prov.dotakeitem(
                                        widget.data["nama"], takeitem);
                                    prov.addhistory =
                                        "Success take ${takeitem} item to Kayu ${widget.data["nama"]}";
                                    takeitem = 0;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(successadd);
                                  },
                        child: const Text("take")),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  List<Map<String, dynamic>> data = [{}];
  Home({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView(
        scrollDirection: Axis.vertical,
        children: data.map((e) => CostumTile(data: e)).toList());
  }
}

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController keysearch = new TextEditingController();

  String keyInput = "";

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu04Provider>(context);

    return Container(
      decoration: BoxDecoration(color: Colors.grey.shade200),
      padding: EdgeInsets.all(12.0),
      child: ListView(
        children: [
          TextField(
            controller: keysearch,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Keyword"),
                fillColor: Colors.grey.shade300),
            onChanged: (value) {
              keyInput = keysearch.text;
              setState(() {});
            },
          ),
          Divider(
            height: 30,
            color: Colors.grey.shade500,
          ),
          Column(
              children: prov.datakayu
                  .map((e) => FilterData(keyword: keyInput, data: e))
                  .toList())
        ],
      ),
    );
  }
}

class FilterData extends StatelessWidget {
  String keyword;
  Map<String, dynamic> data;

  FilterData({super.key, required this.keyword, required this.data});

  @override
  Widget build(BuildContext context) {
    String nama = data["nama"].toLowerCase();
    if (keyword != "") {
      if (nama.contains(keyword)) {
        return CostumTile(data: data);
      } else {
        return Container();
      }
    } else {
      return Container();
    }
  }
}
