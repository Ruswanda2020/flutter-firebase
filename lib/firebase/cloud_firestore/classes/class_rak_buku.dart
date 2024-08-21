import 'package:cloud_firestore/cloud_firestore.dart';

class RakBuku {
  String judulBuku;
  String penulis;
  DateTime publishDate;
  int stokBuku;

  RakBuku({
    required this.judulBuku,
    required this.penulis,
    required this.publishDate,
    required this.stokBuku,
  });

  // Method untuk mengonversi dari JSON ke objek RakBuku
  factory RakBuku.fromJson(Map<String, dynamic> json) {
    return RakBuku(
      judulBuku: json['judulBuku'],
      penulis: json['penulis'],
      publishDate: json['publishDate'].toDate(),
      stokBuku: json['stokBuku'],
    );
  }

  // Method untuk mengonversi objek RakBuku ke format JSON
  Map<String, dynamic> toJson() => {
        'judulBuku': judulBuku,
        'penulis': penulis,
        'publishDate': Timestamp.fromDate(publishDate),
        'stokBuku': stokBuku,
      };
}
