import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase/cloud_firestore/2_simple_add_data/simple_add_data.dart';
import 'package:flutter_firebase/home/halper/cloud_firestore_constan.dart';

class CloudFirestoreList extends StatelessWidget {
  const CloudFirestoreList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 0.2),
          child: Divider(
            height: 1,
          ),
        ),
        const Text("cloud firestore library"),
        const Divider(
          height: 1,
        ),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            //jumlah item yang akan di tampilkan
            itemCount: listCloudFirestoreTopic.length,
            //buat agar bisa di scrollnya horizontal
            scrollDirection: Axis.horizontal,
            //padding untuk listview
            padding: const EdgeInsets.all(8),
            //fungsi build
            itemBuilder: (context, index) {
              return SizedBox(
                width: 200,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) {
                          return listCloudFirestoreTopic[index].page;
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      listCloudFirestoreTopic[index].title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 11),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
