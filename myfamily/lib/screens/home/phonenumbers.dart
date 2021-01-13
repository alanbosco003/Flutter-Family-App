import 'package:flutter/material.dart';
import 'package:myfamily/models/number.dart';
import 'package:myfamily/screens/home/number_tile.dart';
import 'package:provider/provider.dart';

class Phonenumbers extends StatefulWidget {
  @override
  _PhonenumbersState createState() => _PhonenumbersState();
}

class _PhonenumbersState extends State<Phonenumbers> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<Numbers>>(context);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return NumberTile(users: users[index]);
      },
    );
  }
}
