import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu14/minggu14_provider.dart';

class LongRangeToDo extends StatefulWidget {
  const LongRangeToDo({super.key});

  @override
  State<LongRangeToDo> createState() => _LongRangeToDoState();
}

class _LongRangeToDoState extends State<LongRangeToDo> {
  final titlecontroller = TextEditingController();

  TimeOfDay selected_time = TimeOfDay.now();

  DateTimeRange selected_date =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu14Provider>(context);
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.shade600, width: 1.4),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text(
            "Tambahkan LongRange ToDo",
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
                      "${selected_date.start.day} - ${selected_date.start.month} - ${selected_date.start.year}"),
                  SizedBox(
                    height: 2,
                  ),
                  Icon(Icons.arrow_downward),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                      "${selected_date.end.day} - ${selected_date.end.month} - ${selected_date.end.year}"),
                  SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final DateTimeRange? select = await showDateRangePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2025),
                        );
                        if(select != null){
                          setState(() {
                            selected_date = select;
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
          ElevatedButton(onPressed: () {
            if (titlecontroller.text == "") {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("ToDo tidak boleh kosong"),
                    duration: Duration(milliseconds: 1000),
                  ));
                }
                else{
                  prov.setlongRangeToDo = {
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
          }, child: Text("Save"))
        ],
      ),
    );
  }
}
