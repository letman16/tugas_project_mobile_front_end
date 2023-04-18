import 'package:flutter/material.dart';

class Minggu01 extends StatefulWidget {
  const Minggu01({super.key});

  @override
  State<Minggu01> createState() => _Minggu01State();
}

class _Minggu01State extends State<Minggu01> {
  final TextEditingController textstyle = TextEditingController();

  String IsiText =
      "Saya ganteng dan saya bangga pada kegantengan saya. Saya yakin dapat membawa kebaikan pada dunia hanya dengan senyuman saya.";

  void _changeText() {
    setState(() {
      IsiText = textstyle.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 48, 48, 48),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color.fromARGB(255, 0, 156, 81)),
        backgroundColor: Color.fromARGB(255, 22, 22, 22),
        title: const Text(
          "Minggu1",
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
      ),
      body: Container(
          margin: const EdgeInsets.all(10.0),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Header(txt: "!! Contoh icon tanpa styling beserta namanya !!"),
              const TransDivider(),
              SizedBox(
                height: 70,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    IconBox(
                        icon: const Icon(Icons.access_alarm),
                        txt: "access alarm"),
                    IconBox(icon: const Icon(Icons.diamond), txt: "diamond"),
                    IconBox(icon: const Icon(Icons.palette), txt: "palette"),
                    IconBox(
                        icon: const Icon(Icons.laptop_chromebook),
                        txt: "laptop chromebook"),
                    IconBox(icon: const Icon(Icons.usb), txt: "usb"),
                    IconBox(icon: const Icon(Icons.key), txt: "key"),
                    IconBox(icon: const Icon(Icons.class_), txt: "class"),
                    IconBox(icon: const Icon(Icons.yard), txt: "yard"),
                    IconBox(icon: const Icon(Icons.discord), txt: "discord"),
                    IconBox(
                        icon: const Icon(Icons.local_dining),
                        txt: "local dining"),
                    IconBox(icon: const Icon(Icons.pin_end), txt: "pin end"),
                    IconBox(icon: const Icon(Icons.abc), txt: "abc"),
                    IconBox(
                        icon: const Icon(Icons.agriculture),
                        txt: "agriculture"),
                    IconBox(icon: const Icon(Icons.add_box), txt: "add box"),
                    IconBox(
                        icon: const Icon(Icons.smoking_rooms),
                        txt: "smooking rooms"),
                    IconBox(icon: const Icon(Icons.php), txt: "php"),
                    IconBox(
                        icon: const Icon(Icons.domain_rounded),
                        txt: "domain rounded"),
                    IconBox(
                        icon: const Icon(Icons.border_clear),
                        txt: "border clear"),
                  ],
                ),
              ),
              const TinyDivider(),
              Container(
                  alignment: Alignment.center,
                  child: const Text(
                    ">> Styling : Color = blue <<",
                    style: TextStyle(color: Colors.grey),
                  )),
              const TransDivider(),
              SizedBox(
                height: 70,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    IconBox(
                        icon: const Icon(
                          Icons.access_alarm,
                          color: Colors.blue,
                        ),
                        txt: "access alarm"),
                    IconBox(
                        icon: const Icon(color: Colors.blue, Icons.diamond),
                        txt: "diamond"),
                    IconBox(
                        icon: const Icon(color: Colors.blue, Icons.palette),
                        txt: "palette"),
                    IconBox(
                        icon: const Icon(
                            color: Colors.blue, Icons.laptop_chromebook),
                        txt: "laptop chromebook"),
                    IconBox(
                        icon: const Icon(color: Colors.blue, Icons.usb),
                        txt: "usb"),
                    IconBox(
                        icon: const Icon(color: Colors.blue, Icons.key),
                        txt: "key"),
                    IconBox(
                        icon: const Icon(color: Colors.blue, Icons.class_),
                        txt: "class"),
                    IconBox(
                        icon: const Icon(color: Colors.blue, Icons.yard),
                        txt: "yard"),
                    IconBox(
                        icon: const Icon(color: Colors.blue, Icons.discord),
                        txt: "discord"),
                    IconBox(
                        icon:
                            const Icon(color: Colors.blue, Icons.local_dining),
                        txt: "local dining"),
                    IconBox(
                        icon: const Icon(color: Colors.blue, Icons.pin_end),
                        txt: "pin end"),
                    IconBox(
                        icon: const Icon(
                          Icons.abc,
                          color: Colors.blue,
                        ),
                        txt: "abc"),
                    IconBox(
                        icon: const Icon(
                          Icons.agriculture,
                          color: Colors.blue,
                        ),
                        txt: "agriculture"),
                    IconBox(
                        icon: const Icon(
                          Icons.add_box,
                          color: Colors.blue,
                        ),
                        txt: "add box"),
                    IconBox(
                        icon: const Icon(
                          Icons.smoking_rooms,
                          color: Colors.blue,
                        ),
                        txt: "smooking rooms"),
                    IconBox(
                        icon: const Icon(
                          Icons.php,
                          color: Colors.blue,
                        ),
                        txt: "php"),
                    IconBox(
                        icon: const Icon(
                          Icons.domain_rounded,
                          color: Colors.blue,
                        ),
                        txt: "domain rounded"),
                    IconBox(
                        icon: const Icon(
                          Icons.border_clear,
                          color: Colors.blue,
                        ),
                        txt: "border clear"),
                  ],
                ),
              ),
              const BoldDivider(),
              Header(txt: "!! Styling pada Text dan TextSpan !!"),
              const TransDivider(),
              Row(
                children: [
                  const Text("Isi Text : ",
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: TextField(
                      onChanged: (content) {
                        _changeText();
                      },
                      controller: textstyle,
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          filled: true,
                          fillColor: Color.fromARGB(255, 240, 240, 240)),
                    ),
                  )
                ],
              ),
              const TransDivider(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5.0)),
                alignment: Alignment.center,
                child: Text(IsiText),
              ),
              const TransDivider(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5.0)),
                alignment: Alignment.center,
                child: Text(
                  IsiText,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              const TransDivider(),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(5.0)),
                alignment: Alignment.center,
                child: Text(
                  IsiText,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const TransDivider(),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5.0)),
                  alignment: Alignment.center,
                  child: CreateTextSpan(txt: IsiText)),
              const BoldDivider(),
              Header(txt: "!! Gambar !!"),
              const TransDivider(),
              Column(
                children: const [
                  ImagesLink(),
                  Text(
                    "Menggunakan Link Address",
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              const TransDivider(),
              const TransDivider(),
              Column(
                children: const [
                  ImagesAssets(),
                  Text("Menggunakan Assets",
                      style: TextStyle(color: Colors.grey))
                ],
              )
            ],
          )),
    );
  }
}

class Header extends StatelessWidget {
  final String txt;
  Header({super.key, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        txt,
        style: const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }
}

class TransDivider extends StatelessWidget {
  const TransDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 10,
      color: Colors.transparent,
    );
  }
}

class BoldDivider extends StatelessWidget {
  const BoldDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 40,
      color: Colors.black,
      thickness: 3.0,
    );
  }
}

class TinyDivider extends StatelessWidget {
  const TinyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 20.0,
      thickness: 1,
      color: Color.fromARGB(255, 58, 58, 58),
    );
  }
}

class IconBox extends StatelessWidget {
  var icon = const Icon(Icons.abc);
  final String txt;

  IconBox({super.key, required this.icon, required this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      width: 100,
      decoration: BoxDecoration(
          color: Colors.grey, borderRadius: BorderRadius.circular(5.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: icon,
          ),
          Text(
            txt,
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class CreateTextSpan extends StatelessWidget {
  final String txt;
  CreateTextSpan({super.key, required this.txt});

  List<TextStyle> stylespan = [
    TextStyle(fontStyle: FontStyle.italic),
    TextStyle(fontWeight: FontWeight.bold),
    TextStyle(fontStyle: FontStyle.normal)
  ];

  List<TextSpan> spantext = [];

  List<TextSpan> Span() {
    List<String> txtfinal = txt.split(" ");
    int n = 0;
    for (String i in txtfinal) {
      if (n == 3) {
        n = 0;
      }
      spantext.add(TextSpan(text: i + " ", style: stylespan[n]));
      n++;
    }
    return spantext;
  }

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [for (TextSpan i in Span()) i]));
  }
}

class ImagesLink extends StatelessWidget {
  const ImagesLink({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image.network(
          "https://i1.sndcdn.com/artworks-YIQ5yruOzQjwNtFs-xipaog-t500x500.jpg"),
    );
  }
}

class ImagesAssets extends StatelessWidget {
  const ImagesAssets({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Image.asset('assets/ReoNa_Wangy.jpg'),
    );
  }
}
