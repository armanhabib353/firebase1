import 'package:armanfirebase2/HomePage/Model/model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStoreViewModel extends ChangeNotifier {

  String name = "";
  String address = "";
  String message = "";

  // ignore: missing_return
  Future<bool> saveStore() async {
    bool isSaved = false;
    final storeModel = StoreModel(name, address);

    try {
      await FirebaseFirestore.instance.collection('store').add(storeModel.toMap());
      isSaved = true;
      message = "Store has been saved";
      notifyListeners();
    } on Exception catch(_) {
      message = "Unable to save the store";
    } catch(err) {
      message = "Error Occurred!";
    }

    notifyListeners();
    return isSaved;

  }




}
