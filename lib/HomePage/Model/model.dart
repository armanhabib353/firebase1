import 'package:cloud_firestore/cloud_firestore.dart';



class StoreModel {

  final String name;
  final String address;
  DocumentReference reference;

  StoreModel(this.name, this.address, [this.reference]);


  String get storeId {
    return reference.id;
  }

  factory StoreModel.fromSnapshot(QueryDocumentSnapshot doc) {
    return StoreModel(doc['name'], doc['address']);
  }

}