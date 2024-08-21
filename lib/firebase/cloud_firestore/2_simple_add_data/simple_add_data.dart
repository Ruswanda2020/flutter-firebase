import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase/firebase/cloud_firestore/classes/class_rak_buku.dart';
import 'package:flutter_firebase/firebase/cloud_firestore/service/service_rak_buku.dart';
import 'package:get/get.dart';

class SimpleAddData extends StatelessWidget {
  SimpleAddData({super.key});

  //textcontroller
  final TextEditingController penulis = TextEditingController();
  final TextEditingController judulBuku = TextEditingController();
  final TextEditingController stokBuku = TextEditingController();
  //service
  final ServiceRakBuku serviceRakBuku = ServiceRakBuku();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Buku"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        //nama penulis
                        TextField(
                          controller: penulis,
                          decoration: const InputDecoration(
                            label: Text("masukan nama Penulis"),
                          ),
                        ),
                        //nama buku
                        TextField(
                          controller: judulBuku,
                          decoration: const InputDecoration(
                            label: Text("judul buku"),
                          ),
                        ),
                        TextField(
                          controller: stokBuku,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          decoration: const InputDecoration(
                            label: Text("stok buku"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //button add data to cloud firestore
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      width: Get.width * 0.95,
                      child: ElevatedButton(
                        onPressed: () {
                          if (penulis.text.isNotEmpty &&
                              judulBuku.text.isNotEmpty &&
                              stokBuku.text.isNotEmpty) {
                            //membuat objek buku
                            RakBuku buku = RakBuku(
                              judulBuku: judulBuku.text,
                              penulis: penulis.text,
                              publishDate: DateTime.now(),
                              stokBuku: int.parse(stokBuku.text),
                            );

                            //memanggil service
                            serviceRakBuku.addBuku(buku);

                            // Mengosongkan kembali TextField
                            penulis.clear();
                            judulBuku.clear();
                            stokBuku.clear();

                            // Menampilkan snackbar sukses
                            Get.snackbar(
                              "Sukses",
                              "Data buku berhasil ditambahkan",
                              colorText: Colors.white,
                              backgroundColor: Colors.green,
                            );
                          } else {
                            Get.snackbar(
                                "Input Error", "isi semua data terlebih dahulu",
                                colorText: Colors.white,
                                backgroundColor: Colors.red);
                          }
                        },
                        child: const Text("tambah data"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
