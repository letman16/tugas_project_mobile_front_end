import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu14/form_box.dart';
import 'package:tugas_kelompok/minggu14/form_box2.dart';
import 'package:tugas_kelompok/minggu14/minggu14_provider.dart';

class Minggu14 extends StatefulWidget {
  const Minggu14({super.key});

  @override
  State<Minggu14> createState() => _Minggu14State();
}

class _Minggu14State extends State<Minggu14> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu14Provider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        title: Text("Minggu 14"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RegularToDo(),
            LongRangeToDo(),
            Column(
              children: List.generate(prov.regularToDo.length, (index) => Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  border: Border.all(color: Colors.amber, width: 1.2)
                ),
                child: ListTile(
                  title: Text(prov.regularToDo[index]["ToDo"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date : ${prov.regularToDo[index]["Date"].day}-${prov.regularToDo[index]["Date"].month}-${prov.regularToDo[index]["Date"].year}"),
                      Text("Time : ${prov.regularToDo[index]["Time"].hour}:${prov.regularToDo[index]["Time"].minute}")
                    ],
                  ),
                ),
              ))
            ),
            Divider(height: 10, color: Colors.grey,),
            Column(
              children: List.generate(prov.longRangeToDo.length, (index) => Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.lightBlue,
                  border: Border.all(color: Colors.blue, width: 1.2)
                ),
                child: ListTile(
                  title: Text(prov.longRangeToDo[index]["ToDo"]),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Date : ${prov.longRangeToDo[index]["Date"].start.day}-${prov.longRangeToDo[index]["Date"].start.month}-${prov.longRangeToDo[index]["Date"].start.year} -> ${prov.longRangeToDo[index]["Date"].end.day}-${prov.longRangeToDo[index]["Date"].end.month}-${prov.longRangeToDo[index]["Date"].end.year}"),
                      Text("Time : ${prov.longRangeToDo[index]["Time"].hour}:${prov.longRangeToDo[index]["Time"].minute}")
                    ],
                  ),
                  ),
              ))
            )
          ],
        ),
      ),
    );
  }
}