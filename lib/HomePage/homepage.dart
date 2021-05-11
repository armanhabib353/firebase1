import 'package:armanfirebase2/HomePage/VIewModel/load_data.dart';
import 'package:armanfirebase2/HomePage/VIewModel/view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StoreViewModelLoadData _loadData = StoreViewModelLoadData();

  Widget _buildBody(){
    return StreamBuilder<QuerySnapshot>(
      stream: _loadData.loadData,
      builder: (context, snapshot) {
        if(snapshot.hasData && snapshot.data.docs.isNotEmpty) {
          return _buildList(snapshot.data);
        } else {
          return Container(child: Center(child: Text("No Data")),);
        }
      },
    );
}

Widget _buildList(QuerySnapshot snapshot) {
    final stores = snapshot.docs.map((e) => StoreViewModel.fromSnapshot(e)).toList();
    return ListView.builder(
      itemCount: stores.length,
      itemBuilder: (context, index) {
        final store = stores[index];
        return _buildListItem(store);
      },
    );
}

Widget _buildListItem(StoreViewModel storeViewModel) {
    return ListTile(
      title: Text(storeViewModel.name),
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop App"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
      body: _buildBody(),
    );
  }
}
