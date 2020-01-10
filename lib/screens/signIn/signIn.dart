import 'package:flutter/material.dart';


import 'package:municippa/screens/signIn/signInAppBar.dart';
import 'package:municippa/screens/signIn/signInBody.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  bool lockWidget = false;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: lockWidget,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: SignInAppBar(),
          body: SignInBody(notifyParent: lockParent),
        ),
      ),
    );
  }

  lockParent() {
    setState( ()
    {
      lockWidget = !lockWidget;
    }
    );
  }

}