import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase/cloud_firestore/classes/class_rak_buku.dart';
import 'package:flutter_firebase/firebase/cloud_firestore/service/service_rak_buku.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ReadData extends StatelessWidget {
  ReadData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Read Data',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: CardCollectionRakBuku(),
          ),
        ],
      ),
    );
  }
}

class CardCollectionRakBuku extends StatelessWidget {
  CardCollectionRakBuku({super.key});

  final ServiceRakBuku serviceRakBuku = ServiceRakBuku();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<RakBuku>>(
      stream: serviceRakBuku.getDataBuku(),
      builder: (context, snapshot) {
        //ketika error terjadi
        if (snapshot.hasError) {
          return Center(
            child: Text("Error : ${snapshot.error}"),
          );
        }
        //ketika masih loading saat mengambil data
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularPercentIndicator(
              radius: 45.0,
              lineWidth: 4.0,
              percent: 0.10,
              center: const Text("10%"),
              progressColor: Colors.red,
            ),
          );
        }

        //data di terima
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.active) {
          var data = snapshot.data!.docs;
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data[index].data().judulBuku),
                            Text(data[index].data().penulis),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                           "stok buku : ${data[index].data().stokBuku.toString()}",
                          ),
                          Text(
                            DateFormat.yMMMMEEEEd()
                                .format(data[index].data().publishDate),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }
        //data tidak ada
        return const Center(
          child: Text("Tidak Ada Data"),
        );
      },
    );
  }
}
