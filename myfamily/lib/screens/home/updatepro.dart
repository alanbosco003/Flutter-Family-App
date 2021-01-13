import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";

import 'package:myfamily/services/auth.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final AuthService _auth = AuthService();

  final firestoreInstance = Firestore.instance;

  final _formKey = GlobalKey<FormState>();
  int _value = 1;
  String phone = "";
  String name = "";
  String dob = "";
  String gender = "";
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.amber[400],
      appBar: AppBar(
        title: const Text('MY Family', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber[400],
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.amber[400],
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  onChanged: (val) {
                    print("First text field: $val");
                    setState(() => name = val);
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Enter your name',
                    labelText: 'Name',
                  ),
                ),
                TextFormField(
                  onChanged: (val) {
                    print("First text field: $val");
                    setState(() => phone = val);
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.phone),
                    hintText: 'Enter a phone number',
                    labelText: 'Phone',
                  ),
                ),
                TextFormField(
                  onChanged: (val) {
                    print("First text field: $val");
                    setState(() => dob = val);
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.calendar_today),
                    hintText: 'Enter your date of birth',
                    labelText: 'Dob',
                  ),
                ),
                TextFormField(
                  onChanged: (val) {
                    print("First text field: $val");
                    setState(() => email = val);
                  },
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.mail),
                    hintText: 'Enter your Email',
                    labelText: 'Email',
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(40, 10, 10, 10),
                  child: DropdownButton(
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Text("Select"),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Text("Male"),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Text("Female"),
                          value: 3,
                        ),
                      ],
                      onChanged: (value) {
                        if (value == 3) {
                          setState(() {
                            gender = "Female";
                          });
                        } else {
                          setState(() {
                            gender = "Male";
                          });
                        }
                        setState(() {
                          _value = value;
                          gender = gender;
                        });
                      }),
                ),
                new Container(
                    padding: const EdgeInsets.only(left: 150.0, top: 40.0),
                    child: new RaisedButton(
                      child: const Text('Submit'),
                      onPressed: () async {
                        var firebaseUser =
                            await FirebaseAuth.instance.currentUser();
                        firestoreInstance
                            .collection("users")
                            .document(firebaseUser.uid)
                            .setData({
                          "name": "$name",
                          "phone": "$phone",
                          "email": "$email",
                          "gender": "$gender",
                          "dob": "$dob",
                          "address": {"street": "street 24", "city": "new york"}
                        }, merge: true).then((_) {
                          print("success!");
                        });
                      },
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
