import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import 'minggu14_provider.dart';

class RegularToDo extends StatefulWidget {
  const RegularToDo({super.key});

  @override
  State<RegularToDo> createState() => _RegularToDoState();
}

class _RegularToDoState extends State<RegularToDo> {
  final titlecontroller = TextEditingController();

  DateTime selected_date = DateTime.now();

  TimeOfDay selected_time = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu14Provider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade600, width: 1.4),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            "Tambahkan Regular ToDo",
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: titlecontroller,
            decoration: InputDecoration(
                hintText: "To Do", border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                      "${selected_date.day} - ${selected_date.month} - ${selected_date.year}"),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final DateTime? dateTime = await showDatePicker(
                          context: context,
                          initialDate: selected_date,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );
                        if (dateTime != null) {
                          setState(() {
                            selected_date = dateTime;
                          });
                        }
                      },
                      child: Text("Choose date"))
                ],
              ),
              Column(
                children: [
                  Text("${selected_time.hour}:${selected_time.minute}"),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final TimeOfDay? timeDl = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );
                        if (timeDl != null) {
                          setState(() {
                            selected_time = timeDl;
                          });
                        }
                      },
                      child: Text("Choose time Deadline"))
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                if (titlecontroller.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("ToDo tidak boleh kosong"),
                    duration: Duration(milliseconds: 1000),
                  ));
                }
                else{
                  prov.setregularToDo = {
                    "ToDo": titlecontroller.text,
                    "Date": selected_date,
                    "Time": selected_time,
                  };
                  titlecontroller.text = "";
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("berhasil menambahkan"),
                    duration: Duration(milliseconds: 1000),
                  ));
                }
              },
              child: Text("Save"))
        ],
      ),
    );
  }
}
