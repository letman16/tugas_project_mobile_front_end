import 'package:flutter/material.dart';

class Minggu09Provider extends ChangeNotifier {
  String _typeEmail = "Kontak Masuk";
  String get typeEmail => _typeEmail;

  set setTypeEmail(val) {
    _typeEmail = val;
  }

  final List<Map<String, dynamic>> listEmail = [
    {
      "id_email": "AB",
      "nama_pengirim": "Joen Doe",
      "title_email": "Ini adalah judul Email",
      "body_email": "Ini adalah body Email",
      "kategori_email": "Kontak Masuk",
      "tanggal_email": "15.20",
      "star": true
    },
    {
      "id_email": "AC",
      "nama_pengirim": "Lukman Hakim",
      "title_email": "Ini adalah judul Email",
      "body_email": "Ini adalah body Email",
      "kategori_email": "Kontak Masuk",
      "tanggal_email": "16.20",
      "star": true
    },
    {
      "id_email": "AD",
      "nama_pengirim": "Jikky",
      "title_email": "Ini adalah judul Email",
      "body_email": "Ini adalah body Email",
      "kategori_email": "Spam",
      "tanggal_email": "17.50",
      "star": false
    },
    {
      "id_email": "AE",
      "nama_pengirim": "Bobby",
      "title_email": "Ini adalah judul Email",
      "body_email": "Ini adalah body Email",
      "kategori_email": "Kontak Masuk",
      "tanggal_email": "19.10",
      "star": false
    },
    {
      "id_email": "AB",
      "nama_pengirim": "M. Aulia Kahfi",
      "title_email": "Ini adalah judul Email",
      "body_email": "Ini adalah body Email",
      "kategori_email": "Spam",
      "tanggal_email": "21.12",
      "star": false
    }
  ];

  void updateStarStatus(String idEmail) {
    // Temukan email berdasarkan idEmail
    final email = listEmail.firstWhere((email) => email['id_email'] == idEmail);

    // Perbarui status star
    email['star'] = !email['star'];

    // Panggil notifyListeners untuk memberitahu perubahan pada listEmail
    notifyListeners();
  }
}
