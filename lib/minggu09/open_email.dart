import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'minggu09_provider.dart';

class OpenEmail extends StatefulWidget {
  final String idEmail;
  const OpenEmail({Key? key, required this.idEmail}) : super(key: key);

  @override
  State<OpenEmail> createState() => _OpenEmailState();
}

class _OpenEmailState extends State<OpenEmail> {
  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<Minggu09Provider>(context);
    final emailData = prov.listEmail.firstWhere(
      (email) => email['id_email'] == widget.idEmail,
      orElse: () => {},
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Open Email  ${widget.idEmail}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            emailData['title_email'],
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                emailData['kategori_email'],
                style: const TextStyle(fontSize: 12),
              ),
              TextButton(
                  onPressed: () {
                    // Lakukan update star sesuai dengan id_email
                    prov.updateStarStatus(emailData['id_email']);
                  },
                  child: emailData['star']
                      ? const Icon(Icons.star)
                      : const Icon(Icons.star_border))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ListTile(
            leading: const CircleAvatar(
              child: Icon(
                Icons.abc,
                color: Colors.black,
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      emailData['nama_pengirim'],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      emailData['tanggal_email'],
                      style: const TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Kepada saya",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
            trailing: TextButton(
                onPressed: () {
                  infoMail(context);
                },
                child: const Icon(Icons.menu)),
          ),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Text(
            emailData['body_email'],
            style: const TextStyle(fontSize: 16),
          )
        ]),
      ),
    );
  }

  Future<void> infoMail(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Informasi'),
          content: const Text(
            'Maaf, fitur ini belum tersedia',
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
