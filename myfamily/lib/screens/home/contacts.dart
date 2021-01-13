import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:myfamily/models/number.dart';
import 'package:myfamily/screens/home/phonenumbers.dart';
import 'package:myfamily/services/auth.dart';
import "package:myfamily/services/database.dart";
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Contacts extends StatefulWidget {
  final AuthService _auth = AuthService();

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Numbers>>.value(
      value: DatabaseService().users, //or brews
      child: Scaffold(
        backgroundColor: Colors.amber[400],
        appBar: AppBar(
          title: const Text('MY Family', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.amber[400],
          elevation: 0.0,
        ),
        body: Phonenumbers(),
      ),
    );
  }
}
