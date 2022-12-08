import 'package:cloud_firestore/cloud_firestore.dart';

List<Map> Global = [];

class CollectData{
  final CollectionReference musicCollection = FirebaseFirestore.instance.collection("musics");

  Future<List<Map>> getData() async {
    QuerySnapshot querySnapshot = await musicCollection.get();
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

    List<Map> data = [];

    for(int i=0; i<allData.length; i++){
      var temp = allData[i] as Map;
      data.insert(i, temp);
    }

    Global = data;
    return data;
  }
}