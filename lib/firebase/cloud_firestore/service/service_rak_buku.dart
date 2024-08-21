import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/firebase/cloud_firestore/classes/class_rak_buku.dart';

const String collectionName = "rak-buku";

class ServiceRakBuku {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<RakBuku> _rakBukuRef;

  ServiceRakBuku() {
    _rakBukuRef = _firestore.collection(collectionName).withConverter<RakBuku>(
          fromFirestore: (snapshot, _) => RakBuku.fromJson(snapshot.data()!),
          toFirestore: (rakBuku, _) => rakBuku.toJson(),
        );
  }

  // Add data
  Future<void> addBuku(RakBuku buku) async {
    await _rakBukuRef.add(buku);
  }
  //return stream untuk collection rak buku
  Stream<QuerySnapshot<RakBuku>> getDataBuku(){
      return _rakBukuRef.snapshots();
  }
  // Update data
  // Delete data
}
