

import 'package:armanfirebase2/HomePage/Model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreViewModel {

  final StoreModel storeModel;
  StoreViewModel({this.storeModel});

  String get storeId {
    return storeModel.storeId;
  }

  String get name {
    return storeModel.name;
  }

  factory StoreViewModel.fromSnapshot(QueryDocumentSnapshot doc) {
    final store = StoreModel.fromSnapshot(doc);
    return StoreViewModel(storeModel: store);
  }

}