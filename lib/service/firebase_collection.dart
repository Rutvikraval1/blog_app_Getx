
import 'package:cloud_firestore/cloud_firestore.dart';
import 'fire_collection_all_name.dart';

class Firebase_collection {

  Future<dynamic> add_blog_data(add_blog_data_map) async {
    DocumentReference docRef = await FirebaseFirestore.instance
        .collection(Fire_collection_Name().Blog)
        .add(add_blog_data_map);
    var json = {
      "blog_id": docRef.id,
    };
    await update_blog_data(json, docRef.id);
    return docRef.id;
  }

  ///blog Upadte
  Future<dynamic> update_blog_data(
      var jsondata, String docRef_id) async {
    DocumentReference docRef = FirebaseFirestore.instance
        .collection(Fire_collection_Name().Blog)
        .doc(docRef_id);
    docRef.update(jsondata);
    return docRef.id;
  }


  Future<dynamic> getAllblog() async {
    final data = await FirebaseFirestore.instance
        .collection(Fire_collection_Name().Blog)
        .get();
    print("asas");
    print(data.docs);
    return data.docs;
  }
  Future<dynamic> getParticulerblog({String docId=''}) async {
    final data = FirebaseFirestore.instance
        .collection(Fire_collection_Name().Blog).doc(docId).get();
    return data;
  }
}