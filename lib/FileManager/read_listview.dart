import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReadListView extends StatefulWidget {
  const ReadListView({super.key});

  @override
  State<ReadListView> createState() => _ReadListViewState();
}

class _ReadListViewState extends State<ReadListView> {
  final _userStream = FirebaseFirestore.instance.collection("collectionPath");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase.'),
      ),
      body: Container(),
    );
  }
}
