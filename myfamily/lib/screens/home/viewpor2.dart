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

  String _currentName;
  String _currentSugars;
  int _currentStrength;
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
            return Column(
              children: <Widget>[
                Text('Update your brew settings.',
                    style: TextStyle(fontSize: 18.0)),
                SizedBox(height: 20.0),
                TextFormField(
                  initialValue: userdate.name,
                  decoration: textInputDecoratioin,
                  validator: (val) =>
                      val.isEmpty ? 'please enter a name' : null,
                  onChanged: (val) => setState(() => _currentName = val),
                ),
                SizedBox(height: 20.0),
                //dropdown
                DropdownButtonFormField(
                  decoration: textInputDecoratioin,
                  value: _currentSugars ?? userdate.name,
                  items: sugars.map((sugar) {
                    return DropdownMenuItem(
                      value: sugar,
                      child: Text('$sugar sugars'),
                    );
                  }).toList(),
                  onChanged: (val) => setState(() => _currentSugars = val),
                ),

                RaisedButton(
                    color: Colors.pink[400],
                    child: Text(
                      'Update',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      if (_formkey.currentState.validate()) {
                        await DatabaseService(uid: user.uid).updateUserData(
                            _currentSugars ?? userdate.phone,
                            _currentName ?? userdate.name,
                            _currentStrength ?? userdate.phone);
                        Navigator.pop(context);
                      }
                    })
              ],
            );
          } else {
            return Loading();
          }
        });
  }
}
