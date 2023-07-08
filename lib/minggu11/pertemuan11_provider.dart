import 'package:flutter/material.dart';
import 'dart:convert';

class Minggu11Provider extends ChangeNotifier {
  initialData() async {
    setData = Mendatang;
  }

  var currentPage = 'Mendatang';

  final Mendatang = {
    "data": [
      {
        "Judul": "Meeting",
        "Keterangan": "Meeting dengan boss besar",
        "Waktu": "10:00 AM",
        "Tanggal": "08 Juli 2023",
      },
      {
        "Judul": "Presentasi Proyek",
        "Keterangan": "Presentasi proyek kepada klien",
        "Waktu": "13:00 PM",
        "Tanggal": "09 Juli 2023",
      },
      {
        "Judul": "Pelatihan Karyawan",
        "Keterangan": "Pelatihan baru bagi karyawan",
        "Waktu": "09:30 AM",
        "Tanggal": "10 Juli 2023",
      },
      {
        "Judul": "Rapat Tim",
        "Keterangan": "Rapat rutin dengan tim proyek",
        "Waktu": "14:00 PM",
        "Tanggal": "11 Juli 2023",
      },
      {
        "Judul": "Pertemuan Vendor",
        "Keterangan": "Pertemuan dengan vendor untuk negosiasi",
        "Waktu": "11:30 AM",
        "Tanggal": "12 Juli 2023",
      },
      {
        "Judul": "Piknik Perusahaan",
        "Keterangan": "Piknik perusahaan untuk meningkatkan kerjasama tim",
        "Waktu": "09:00 AM",
        "Tanggal": "13 Juli 2023",
      },
      {
        "Judul": "Sesi Brainstorming",
        "Keterangan": "Sesi brainstorming untuk ide-ide baru",
        "Waktu": "15:30 PM",
        "Tanggal": "14 Juli 2023",
      },
      {
        "Judul": "Wawancara Kandidat",
        "Keterangan": "Wawancara dengan kandidat posisi baru",
        "Waktu": "10:30 AM",
        "Tanggal": "15 Juli 2023",
      },
      {
        "Judul": "Kunjungan Pelanggan",
        "Keterangan": "Kunjungan ke pelanggan untuk evaluasi kepuasan",
        "Waktu": "13:30 PM",
        "Tanggal": "16 Juli 2023",
      },
      {
        "Judul": "Makan Siang Bersama",
        "Keterangan": "Makan siang bersama tim proyek",
        "Waktu": "12:00 PM",
        "Tanggal": "17 Juli 2023",
      },
      {
        "Judul": "Pembaruan Sistem",
        "Keterangan": "Pembaruan sistem untuk meningkatkan kinerja",
        "Waktu": "09:30 AM",
        "Tanggal": "18 Juli 2023",
      },
      {
        "Judul": "Pertemuan Pemasaran",
        "Keterangan": "Pertemuan untuk merencanakan strategi pemasaran",
        "Waktu": "14:00 PM",
        "Tanggal": "19 Juli 2023",
      },
      {
        "Judul": "Acara Perusahaan",
        "Keterangan": "Acara perusahaan tahunan",
        "Waktu": "17:00 PM",
        "Tanggal": "20 Juli 2023",
      },
      {
        "Judul": "Rapat Evaluasi Proyek",
        "Keterangan": "Rapat untuk mengevaluasi proyek",
        "Waktu": "11:00 AM",
        "Tanggal": "21 Juli 2023",
      },
      {
        "Judul": "Peluncuran Produk",
        "Keterangan": "Peluncuran produk baru kepada publik",
        "Waktu": "15:30 PM",
        "Tanggal": "22 Juli 2023",
      },
      {
        "Judul": "Kunjungan Pabrik",
        "Keterangan": "Kunjungan ke pabrik mitra kerja",
        "Waktu": "09:00 AM",
        "Tanggal": "23 Juli 2023",
      },
      {
        "Judul": "Sesi Pelatihan",
        "Keterangan": "Sesi pelatihan untuk meningkatkan keterampilan",
        "Waktu": "13:30 PM",
        "Tanggal": "24 Juli 2023",
      },
      {
        "Judul": "Rapat Strategi",
        "Keterangan": "Rapat untuk merumuskan strategi bisnis",
        "Waktu": "10:30 AM",
        "Tanggal": "25 Juli 2023",
      },
      {
        "Judul": "Pertemuan Investasi",
        "Keterangan": "Pertemuan dengan investor potensial",
        "Waktu": "16:00 PM",
        "Tanggal": "26 Juli 2023",
      },
      {
        "Judul": "Diskusi Kreatif",
        "Keterangan": "Diskusi untuk menghasilkan ide kreatif",
        "Waktu": "09:30 AM",
        "Tanggal": "27 Juli 2023",
      },
      {
        "Judul": "Konsultasi Keuangan",
        "Keterangan": "Konsultasi dengan ahli keuangan",
        "Waktu": "14:30 PM",
        "Tanggal": "28 Juli 2023",
      },
      {
        "Judul": "Acara Pelanggan",
        "Keterangan": "Acara untuk menghargai pelanggan",
        "Waktu": "16:30 PM",
        "Tanggal": "29 Juli 2023",
      },
      {
        "Judul": "Pertemuan Persiapan Proyek",
        "Keterangan": "Pertemuan untuk persiapan proyek baru",
        "Waktu": "11:00 AM",
        "Tanggal": "30 Juli 2023",
      },
      {
        "Judul": "Pemantauan Kinerja",
        "Keterangan": "Pemantauan kinerja tim proyek",
        "Waktu": "15:00 PM",
        "Tanggal": "31 Juli 2023",
      },
    ]
  };

  final Selesai = {
    "data": [
      {
        "Judul": "Presentasi Penjualan",
        "Keterangan": "Presentasi hasil penjualan kepada tim",
        "Waktu": "10:00 AM",
        "Tanggal": "08 Juli 2023",
      },
      {
        "Judul": "Diskusi Strategi",
        "Keterangan": "Diskusi untuk merumuskan strategi baru",
        "Waktu": "13:00 PM",
        "Tanggal": "07 Juli 2023",
      },
      {
        "Judul": "Pelatihan Keterampilan",
        "Keterangan": "Pelatihan untuk meningkatkan keterampilan",
        "Waktu": "09:30 AM",
        "Tanggal": "06 Juli 2023",
      },
      {
        "Judul": "Rapat Evaluasi Proyek",
        "Keterangan": "Rapat untuk mengevaluasi progres proyek",
        "Waktu": "14:00 PM",
        "Tanggal": "05 Juli 2023",
      },
      {
        "Judul": "Kunjungan Mitra Bisnis",
        "Keterangan": "Kunjungan ke mitra bisnis untuk kolaborasi",
        "Waktu": "11:30 AM",
        "Tanggal": "04 Juli 2023",
      },
      {
        "Judul": "Piknik Rekreasi",
        "Keterangan": "Piknik rekreasi bersama tim",
        "Waktu": "09:00 AM",
        "Tanggal": "03 Juli 2023",
      },
      {
        "Judul": "Sesi Brainstorming Produk",
        "Keterangan": "Sesi brainstorming untuk pengembangan produk",
        "Waktu": "15:30 PM",
        "Tanggal": "02 Juli 2023",
      },
      {
        "Judul": "Rapat Strategi Pemasaran",
        "Keterangan": "Rapat untuk merencanakan strategi pemasaran baru",
        "Waktu": "10:30 AM",
        "Tanggal": "01 Juli 2023",
      },
      {
        "Judul": "Konsultasi Keuangan",
        "Keterangan": "Konsultasi dengan ahli keuangan",
        "Waktu": "13:30 PM",
        "Tanggal": "30 Juni 2023",
      },
      {
        "Judul": "Rapat Pengembangan Produk",
        "Keterangan": "Rapat untuk pengembangan produk baru",
        "Waktu": "12:00 PM",
        "Tanggal": "29 Juni 2023",
      },
      {
        "Judul": "Pembaruan Sistem",
        "Keterangan": "Pembaruan sistem untuk meningkatkan kinerja",
        "Waktu": "09:30 AM",
        "Tanggal": "28 Juni 2023",
      },
      {
        "Judul": "Pertemuan Tim Kreatif",
        "Keterangan": "Pertemuan untuk diskusi ide kreatif",
        "Waktu": "14:00 PM",
        "Tanggal": "27 Juni 2023",
      },
      {
        "Judul": "Acara Perusahaan",
        "Keterangan": "Acara perusahaan tahunan",
        "Waktu": "17:00 PM",
        "Tanggal": "26 Juni 2023",
      },
      {
        "Judul": "Rapat Evaluasi Proyek",
        "Keterangan": "Rapat untuk mengevaluasi proyek",
        "Waktu": "11:00 AM",
        "Tanggal": "25 Juni 2023",
      },
      {
        "Judul": "Peluncuran Produk",
        "Keterangan": "Peluncuran produk baru kepada publik",
        "Waktu": "15:30 PM",
        "Tanggal": "24 Juni 2023",
      },
      {
        "Judul": "Kunjungan Pabrik",
        "Keterangan": "Kunjungan ke pabrik mitra kerja",
        "Waktu": "09:00 AM",
        "Tanggal": "23 Juni 2023",
      },
      {
        "Judul": "Sesi Pelatihan",
        "Keterangan": "Sesi pelatihan untuk meningkatkan keterampilan",
        "Waktu": "13:30 PM",
        "Tanggal": "22 Juni 2023",
      },
      {
        "Judul": "Rapat Strategi",
        "Keterangan": "Rapat untuk merumuskan strategi bisnis",
        "Waktu": "10:30 AM",
        "Tanggal": "21 Juni 2023",
      },
      {
        "Judul": "Pertemuan Investor",
        "Keterangan": "Pertemuan dengan investor potensial",
        "Waktu": "16:00 PM",
        "Tanggal": "20 Juni 2023",
      },
      {
        "Judul": "Diskusi Kreatif",
        "Keterangan": "Diskusi untuk menghasilkan ide kreatif",
        "Waktu": "09:30 AM",
        "Tanggal": "19 Juni 2023",
      },
      {
        "Judul": "Konsultasi HR",
        "Keterangan": "Konsultasi dengan tim HR",
        "Waktu": "14:30 PM",
        "Tanggal": "18 Juni 2023",
      },
      {
        "Judul": "Acara Pelanggan",
        "Keterangan": "Acara untuk menghargai pelanggan",
        "Waktu": "16:30 PM",
        "Tanggal": "17 Juni 2023",
      },
      {
        "Judul": "Pertemuan Persiapan Proyek",
        "Keterangan": "Pertemuan untuk persiapan proyek baru",
        "Waktu": "11:00 AM",
        "Tanggal": "16 Juni 2023",
      },
      {
        "Judul": "Pemantauan Kinerja",
        "Keterangan": "Pemantauan kinerja tim proyek",
        "Waktu": "15:00 PM",
        "Tanggal": "15 Juni 2023",
      },
      {
        "Judul": "Kunjungan Supplier",
        "Keterangan": "Kunjungan ke supplier untuk evaluasi",
        "Waktu": "10:00 AM",
        "Tanggal": "14 Juni 2023",
      },
      {
        "Judul": "Rapat Proyek",
        "Keterangan": "Rapat tim proyek untuk sinkronisasi",
        "Waktu": "13:00 PM",
        "Tanggal": "13 Juni 2023",
      },
    ]
  };

  dynamic _data;
  dynamic get data => _data;
  set setData(val) {
    var tmp = json.encode(val);
    _data = json.decode(tmp);

    notifyListeners();
  }

  ubahList(val) {
    if (val == 'Mendatang') {
      setData = Mendatang;
    } else {
      setData = Selesai;
    }
  }

  clearPage() {
    //_data = null;
    if (currentPage == 'Mendatang') {
      Mendatang.clear();
      _data = null;
    } else {
      Selesai.clear();
      _data = null;
    }
    notifyListeners();
  }
}
