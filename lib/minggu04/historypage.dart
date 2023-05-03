import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu04/minggu04_provider.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu04Provider>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Action History")),
      body: Container(
          padding: const EdgeInsets.all(8.0), child: const HistoryShow()),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Are you sure to clear all history"),
                    content: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancel")),
                        ElevatedButton(
                            onPressed: () {
                              prov.clearhistory();
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Success clear all history"),
                                duration: Duration(milliseconds: 500),
                              ));
                            },
                            child: const Text("Sure"))
                      ],
                    ),
                  );
                });
          },
          child: const Icon(Icons.clear)),
    );
  }
}

class HistoryItem extends StatelessWidget {
  String text;
  HistoryItem({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
    );
  }
}

class HistoryShow extends StatelessWidget {
  const HistoryShow({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu04Provider>(context);
    return Container(
      child: prov.history.length == 0
          ? const ListTile(
              title: Text("History Empty Dude, go do something."),
            )
          : ListView(
              children: prov.history.map((e) => HistoryItem(text: e)).toList(),
            ),
    );
  }
}
