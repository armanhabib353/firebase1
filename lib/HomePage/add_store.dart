import 'package:armanfirebase2/HomePage/VIewModel/add_store_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


// ignore: must_be_immutable
class AddStorePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  AddStoreViewModel _addStoreViewModel = AddStoreViewModel();

  void _saveStore(BuildContext context) async {
    if(_formKey.currentState.validate()) {
      final isSaved = _addStoreViewModel.saveStore();
      if(isSaved != null) {
        Navigator.pop(context);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    _addStoreViewModel = Provider.of<AddStoreViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Store"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) => _addStoreViewModel.name = value,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please Enter your Store Name";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Input Name Here..."),
              ),
              TextFormField(
                onChanged: (value) => _addStoreViewModel.address = value,
                validator: (value) {
                  if(value.isEmpty) {
                    return "Please Enter your Address.";
                  }
                  return null;
                },
                decoration: InputDecoration(hintText: "Enter your Address.."),
              ),
              ElevatedButton(onPressed: () {
                _saveStore(context);
              }, child: Text("Add Store")),
              Spacer(),
              Text(_addStoreViewModel.message),
              SizedBox(height: 200,),
            ],
          ),
        ),
      ),
    );
  }
}
