import 'package:cloud_firestore/cloud_firestore.dart';

class StoreViewModelLoadData {
  Stream<QuerySnapshot> get loadData {
    return FirebaseFirestore.instance.collection('store').snapshots();
  }
}
