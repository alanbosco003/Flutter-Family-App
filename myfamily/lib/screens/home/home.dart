import "package:flutter/material.dart";
import 'package:myfamily/authinticate/register.dart';
import 'package:myfamily/models/brew.dart';
import 'package:myfamily/screens/home/contacts.dart';
import 'package:myfamily/screens/home/settings_form.dart';
import 'package:myfamily/screens/home/updatepro.dart';
import 'package:myfamily/screens/home/viewpro.dart';
import 'package:myfamily/services/auth.dart';
import 'package:myfamily/services/database.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForms(),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.amber[400],
        appBar: AppBar(
          title: const Text('MY Family', style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.amber[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(Icons.person),
              label: Text('LogOut'),
            ),
            FlatButton.icon(
              onPressed: () => _showSettingsPanel(),
              icon: Icon(Icons.settings),
              label: Text('settings'),
            ),
          ],
        ),
        body: Container(
          color: Colors.amber[400],
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  width: 0.0,
                  height: 150.0,
                ),
                SizedBox(
                  width: 0.0,
                  height: 15.0,
                ),
                SizedBox(
                  width: 0.0,
                  height: 25.0,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 240.0,
                      height: 48.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Contacts()),
                          );
                        },
                        textColor: Colors.white, //  SUBSTRACT
                        color: const Color(0xff2c2c2c),
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            side: BorderSide(color: Colors.black)),
                        child: Text(
                          'View Contacts',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.0,
                  height: 10.0,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 240.0,
                      height: 48.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsForms()),
                          );
                        },
                        textColor: Colors.white, //  SUBSTRACT
                        color: const Color(0xff2c2c2c),
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            side: BorderSide(color: Colors.black)),
                        child: Text(
                          'View My Profile',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 0.0,
                  height: 10.0,
                ),
                Container(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 240.0,
                      height: 48.0,
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Update()),
                          );
                        },
                        textColor: Colors.white, //  SUBSTRACT
                        color: const Color(0xff2c2c2c),
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                            side: BorderSide(color: Colors.black)),
                        child: Text(
                          'Update Profile',
                          style: TextStyle(
                            fontFamily: 'Arial',
                            fontSize: 18,
                            color: Colors.white,
                            height: 1.4,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
