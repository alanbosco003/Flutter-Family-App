import 'package:flutter/material.dart';
import 'package:myfamily/models/number.dart';

class NumberTile extends StatelessWidget {
  final Numbers users;
  NumberTile({this.users});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: const Icon(Icons.phone),
          title: Text(users.name),
          subtitle: Text(users.phone),
        ),
      ),
    );
  }
}
