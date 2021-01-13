import 'package:myfamily/authinticate/authenticate.dart';
import 'package:myfamily/models/user.dart';
import 'package:myfamily/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    // return home or auth..
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
