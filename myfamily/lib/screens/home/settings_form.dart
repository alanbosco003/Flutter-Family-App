import 'package:flutter/material.dart';
import 'package:myfamily/models/user.dart';
import 'package:myfamily/services/database.dart';
import 'package:myfamily/shared/constants.dart';
import 'package:myfamily/shared/loding.dart';
import 'package:provider/provider.dart';

class SettingsForms extends StatefulWidget {
  @override
  _SettingsFormsState createState() => _SettingsFormsState();
}

class _SettingsFormsState extends State<SettingsForms> {
  final _formkey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  int min;
  int max;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userdate = snapshot.data;
            return Scaffold(
                backgroundColor: Colors.amber[400],
                appBar: AppBar(
                  title: const Text('MY Family',
                      style: TextStyle(color: Colors.black)),
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
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Name               : ',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  userdate.name,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Phone              : ',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  userdate.phone,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Email                : ',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  userdate.email,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Date of birth    : ',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  userdate.dob,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                  'Gender              : ',
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  userdate.gender,
                                  textAlign: TextAlign.left,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Padding(
                        //  padding: EdgeInsets.fromLTRB(30, 20, 2, 1),
                        //child: Text(
                        //'Gender   : %%%%%%%%%%',
                        //textAlign: TextAlign.left,
                        //overflow: TextOverflow.ellipsis,
                        //style: TextStyle(
                        //  fontWeight: FontWeight.bold, fontSize: 20),
                        //             )),
                      ],
                    ),
                  ),
                ));
          } else {
            return Loading();
          }
        });
  }
}
