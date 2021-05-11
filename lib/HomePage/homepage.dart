import 'package:armanfirebase2/HomePage/VIewModel/add_store_view_model.dart';
import 'package:armanfirebase2/HomePage/VIewModel/view_model.dart';
import 'package:armanfirebase2/HomePage/add_store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // StoreViewModelLoadData _loadData = StoreViewModelLoadData();
  final _loadData = FirebaseFirestore.instance.collection('store').snapshots();

  Widget _buildBody(){
    return StreamBuilder<QuerySnapshot>(
      stream: _loadData,
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

void _navigateToAddStore(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => ChangeNotifierProvider(
      create: (context) => AddStoreViewModel(),
      child: AddStorePage(),
    ), fullscreenDialog: true));
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shop App"),
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: () {
            _navigateToAddStore(context);
          }),
        ],
      ),
      body: _buildBody(),
    );
  }
}
