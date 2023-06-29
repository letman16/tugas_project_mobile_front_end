import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:tugas_kelompok/minggu10/minggu10.dart';

class Minggu10 extends StatefulWidget {
  const Minggu10({super.key});

  @override
  State<Minggu10> createState() => _Minggu10State();
}

class _Minggu10State extends State<Minggu10> {
  bool loadingupdate = false;
  bool updated = false;
  bool shownot = true;

  SnackBar addfavSnackBar() {
    return SnackBar(
      content: Text("Berhasil menambahkan ke favorit"),
      duration: Duration(milliseconds: 700),
    );
  }

  SnackBar movefavSnackBar() {
    return SnackBar(
      content: Text("Berhasil menghapus dari favorit"),
      duration: Duration(milliseconds: 700),
    );
  }

  SnackBar deleteItemSnackBar() {
    return SnackBar(
      content: Text("Berhasil menghapus lagu dari daftar"),
      duration: Duration(milliseconds: 700),
    );
  }

  MaterialBanner askUpdate(context) {
    return MaterialBanner(content: Text("update your page ?"), actions: [
      TextButton(
          onPressed: ()async{
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            update();
          },
          child: Text(
            "Update",
            style: TextStyle(color: Colors.amber),
          )),
      TextButton(
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
          },
          child: Text(
            "Dismiss",
            style: TextStyle(color: Colors.amber),
          )),
    ]);
  }

  update()async{
    loadingupdate = true;
    setState(() {});
    await Future.delayed(Duration(seconds: 2), () {
      updated = true;
      loadingupdate = false;
    });
    setState(() {});
  }

  ListTileSong(BuildContext context) {
    final prov = Provider.of<Minggu10Provider>(context);
    List<Widget> lTile = [];

    dynamic e;

    for (int i = 0; i < prov.data.length; i++) {
      e = prov.data[i];
      lTile.add(Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
        decoration: BoxDecoration(
          border: Border.all(
              color: e["favorit"] ? Colors.pink.shade400 : Colors.grey,
              width: 2.0),
        ),
        child: ListTile(
          title: Row(
            children: [
              updated
                ? e["favorit"] ? Icon(Icons.star, color: Colors.yellow,) : Container()
                : Container(),
                SizedBox(width: 5,),
              Text(e["judul"]),
            ],
          ),
          tileColor: e["favorit"] ? Colors.pink.shade200 : Colors.grey.shade200,
          trailing: PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text(prov.data[i]["favorit"]
                          ? "Hapus dari favorit"
                          : "Tambahkan ke favorit"),
                      onTap: () {
                        prov.changefav(i);
                        prov.data[i]["favorit"]
                            ? ScaffoldMessenger.of(context)
                                .showSnackBar(addfavSnackBar())
                            : ScaffoldMessenger.of(context)
                                .showSnackBar(movefavSnackBar());
                        setState(() {});
                      },
                    ),
                    PopupMenuItem(
                      child: Text("Hapus lagu"),
                      onTap: () {
                        prov.delete_data(i);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(deleteItemSnackBar());
                        setState(() {});
                      },
                    ),
                  ]),
        ),
      ));
    }
    return lTile;
  }

  bool shownotif = true;

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();

    final prov = Provider.of<Minggu10Provider>(context);
    return Scaffold(
        backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          title: Text("Minggu10"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  bool fav = false;
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) {
                      return AlertDialog(
                        title: Text("Menambahkan Lagu"),
                        content: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                controller: titleController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Judul Lagu"),
                              ),
                              Row(
                                children: [
                                  Checkbox(
                                      value: fav,
                                      onChanged: (value) {
                                        setState(() {
                                          fav = value!;
                                        });
                                      }),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text("Set as Favorite")
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text("Cancel")),
                                  ElevatedButton(
                                      onPressed: () {
                                        prov.add_data(
                                            titleController.text, fav);
                                        Navigator.pop(context);
                                      },
                                      child: Text("Simpan"))
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                });
          },
          child: const Icon(Icons.add),
        ),
        body: Stack(children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                shownot
                    ? ListTile(
                        onTap: () {
                          shownot = false;
                          ScaffoldMessenger.of(context)
                              .showMaterialBanner(askUpdate(context));
                          setState(() {});
                        },
                        title: Center(
                          child: Row(children: [
                            Icon(Icons.notification_important),
                            SizedBox(
                              width: 10,
                            ),
                            Text("New Update !!!")
                          ]),
                        ),
                      )
                    : SizedBox(
                        height: 10,
                      ),
                Text(
                  "List Lagu",
                  style: TextStyle(color: Colors.grey, fontSize: 25),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: ListTileSong(context),
                  ),
                )
              ],
            ),
          ),
          loadingupdate
          ? Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
              color: Colors.black.withOpacity(0.5),
              child: CircularProgressIndicator(),
            ),
          )
          : Container()
        ]));
  }
}
