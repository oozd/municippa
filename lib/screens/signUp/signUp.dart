import 'package:flutter/material.dart';

import 'package:municippa/screens/signUp/signUpAppBar.dart';
import 'package:municippa/screens/signUp/signUpBody.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  bool lockWidget = false;


  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: lockWidget,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: SignUpAppBar(),
          body: SignUpBody(notifyParent: lockParent),
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

