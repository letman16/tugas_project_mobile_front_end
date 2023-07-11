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
      "title_email": "Lorem, ipsum dolor sit amet consectetur adipisicing.",
      "body_email":
          "Lorem ipsum dolor, sit amet consectetur adipisicing elit. Autem, molestias.",
      "kategori_email": "Kontak Masuk",
      "tanggal_email": "15.20",
      "star": true
    },
    {
      "id_email": "AC",
      "nama_pengirim": "Lukman Hakim",
      "title_email": "Quasi tenetur dolorem qui, odit quos dolorum possimus",
      "body_email":
          "Rerum at voluptatibus rem blanditiis quo sed! Sit fugiat obcaecati, veritatis culpa autem, libero recusandae a esse saepe non tempora voluptates nostrum aspernatur",
      "kategori_email": "Kontak Masuk",
      "tanggal_email": "16.20",
      "star": true
    },
    {
      "id_email": "AD",
      "nama_pengirim": "Jikky",
      "title_email":
          "officia magnam reprehenderit illum harum sunt voluptatum fugit",
      "body_email":
          "libero recusandae a esse saepe non tempora voluptates nostrum aspernatur illo deserunt? Illo dolores iste eligendi ipsam repellat ducimus ab recusandae velit!",
      "kategori_email": "Spam",
      "tanggal_email": "17.50",
      "star": false
    },
    {
      "id_email": "AE",
      "nama_pengirim": "Bobby",
      "title_email":
          "dolores iste eligendi ipsam repellat ducimus ab recusandae",
      "body_email":
          "impedit magnam dignissimos voluptate necessitatibus minima eum magni labore reprehenderit aperiam sunt, voluptates deleniti atque quaerat",
      "kategori_email": "Kontak Masuk",
      "tanggal_email": "19.10",
      "star": false
    },
    {
      "id_email": "AF",
      "nama_pengirim": "M. Aulia Kahfi",
      "title_email": "eritatis culpa autem, libero recusandae a esse saepe ",
      "body_email":
          "amet adipisci ad veniam id delectus tempora doloremque accusamus obcaecati tenetur, impedit magnam dignissimos voluptate necessitatibus minima eum magni labore reprehenderit aperiam sunt, voluptates deleniti atque quaerat",
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
