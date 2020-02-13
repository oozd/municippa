import 'package:flutter/material.dart';

import 'package:municippa/screens/sign_up/sign_up_app_bar.dart';
import 'package:municippa/screens/sign_up/sign_up_body.dart';

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

