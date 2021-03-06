import 'package:flutter/material.dart';
import 'package:myfamily/screens/home/contacts.dart';
import 'package:myfamily/screens/home/settings_form.dart';
import 'package:myfamily/screens/home/updatepro.dart';

class Home1 extends StatefulWidget {
  @override
  _Home1State createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
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
      
    );
  }
}