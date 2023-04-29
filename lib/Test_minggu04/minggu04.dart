import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/Test_minggu04/historypage.dart';
import 'package:tugas_kelompok/Test_minggu04/minggu04_provider.dart';

class Minggu04 extends StatefulWidget {
  const Minggu04({super.key});

  @override
  State<Minggu04> createState() => _Minggu04State();
}

class _Minggu04State extends State<Minggu04> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu04Provider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minggu 04"),
        centerTitle: true,
      ),
      body: Item(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HistoryPage()));
        },
        child: const Icon(Icons.history),
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
          color: Colors.grey.shade200),
      child: ExpansionTile(
        key: GlobalKey(),
        initiallyExpanded: mydata.elementAt(0)["expanded"],
        onExpansionChanged: (value) {
          prov.expanditem(widget.data["nama"]);
        },
        backgroundColor: Colors.grey.shade200,
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

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu04Provider>(context);
    return ListView(
        scrollDirection: Axis.vertical,
        children: prov.datakayu.map((e) => CostumTile(data: e)).toList());
  }
}

class MyWidget extends StatefulWidget {
  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late int selected; //attention

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Short Product"),
      ),
      body: ListView.builder(
        key: Key('builder ${selected.toString()}'), //attention
        itemCount: 10,
        itemBuilder: (context, i) {
          return ExpansionTile(
              key: Key(i.toString()), //attention
              initiallyExpanded: i == selected, //attention
              title: Text(i.toString()),
              children: _Product_ExpandAble_List_Builder(i),
              onExpansionChanged: ((newState) {
                if (newState)
                  setState(() {
                    selected = i;
                  });
                else
                  setState(() {
                    selected = -1;
                  });
              }));
        },
      ),
    );
  }

  _Product_ExpandAble_List_Builder(int cat_id) {
    List<Widget> columnContent = [];
    [1, 2, 4, 5].forEach((product) => {
          columnContent.add(
            ListTile(
              title: ExpansionTile(
                title: Text(product.toString()),
              ),
              trailing: Text("$product (Kg)"),
            ),
          ),
        });
    return columnContent;
  }
}
