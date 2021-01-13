import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import 'package:myfamily/models/user.dart';
import 'package:myfamily/services/database.dart';
import 'package:provider/provider.dart';

class Viewpro extends StatefulWidget {
  @override
  _ViewproState createState() => _ViewproState();
}

class _ViewproState extends State<Viewpro> {
  @override
  Widget build(BuildContext context) {
    final details = Provider.of<UserData>(context);

    return StreamProvider<UserData>.value(
      value: DatabaseService().details,
      child: Scaffold(
          backgroundColor: Colors.amber[400],
          appBar: AppBar(
            title:
                const Text('MY Family', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.amber[400],
            elevation: 0.0,
          ),
          body: Container(
            color: Colors.amber[400],
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: 0.0,
                    height: 15.0,
                  ),
                  Center(
                    child: Icon(
                      Icons.person,
                      color: Colors.black,
                      size: 70.0,
                    ),
                  ),
                  SizedBox(
                    width: 0.0,
                    height: 30.0,
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                      child: Text(details.name)),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                      child: Text(
                        'Phone    : %%%%%%%%%%',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                      child: Text(
                        'Email      : %%%%%%%%%%',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                      child: Text(
                        'Gender   : %%%%%%%%%%',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                      child: Text(
                        'DOB        : %%%%%%%%%%',
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
