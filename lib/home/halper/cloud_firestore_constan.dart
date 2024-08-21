import 'package:flutter_firebase/firebase/cloud_firestore/1_read_data/read_data.dart';
import 'package:flutter_firebase/firebase/cloud_firestore/2_simple_add_data/simple_add_data.dart';

class CloudFirestoreTopic {
  String title;
  dynamic page;

  CloudFirestoreTopic(this.title, this.page);
}

List<CloudFirestoreTopic> listCloudFirestoreTopic = [
  CloudFirestoreTopic(
    //simple add data
    "Simple Add Data",
    SimpleAddData(),
    
  ),
   CloudFirestoreTopic(
    //simple add data
    "Read Data",
    ReadData(),
    
  ),
  
];
