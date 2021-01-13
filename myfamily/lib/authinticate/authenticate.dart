import 'package:myfamily/authinticate/sign_in.dart';
import 'package:myfamily/authinticate/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleview() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return Login(toggleview: toggleview);
    } else {
      return Signup(toggleview: toggleview);
    }
  }
}
