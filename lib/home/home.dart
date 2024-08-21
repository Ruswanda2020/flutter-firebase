import 'package:flutter/material.dart';
import 'package:flutter_firebase/firebase/cloud_firestore/2_simple_add_data/simple_add_data.dart';
import 'package:flutter_firebase/home/components/cloud_firestore_list.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // disable debug banner
      debugShowCheckedModeBanner: false,
      title: 'Flutter-Firebase Library Kuldi-Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home Page',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple, // Sesuaikan warna dengan tema
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: const Column(
            children: [
              // Pengganti App Bar Custom untuk Windows

              // Fitur Cloud Firestore Library
              CloudFirestoreList(),

              // List semua fitur firebase yang ada
              Expanded(child: SizedBox()),

              // Fitur diluar firebase / Episode pengisi
            ],
          ),
        ),
      ),
    );
  }
}
