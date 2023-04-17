import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu07/minggu07_provider.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Text(Provider.of<Minggu07Provider>(context).teman.length.toString()),
          TextButton(
            child: Text('Delete Nurul Hasanah'),
            onPressed: () {
              Provider.of<Minggu07Provider>(context, listen: false).setdelete =
                  'Nurul Hasanah';
            },
          ),
        ]),
      ),
    );
  }
}
