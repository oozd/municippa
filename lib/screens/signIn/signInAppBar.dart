import 'package:flutter/material.dart';

class SignInAppBar extends StatefulWidget implements PreferredSizeWidget{

  SignInAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight*0.8), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _SignInAppBarState createState() => _SignInAppBarState();
}

class _SignInAppBarState extends State<SignInAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed:() => Navigator.popUntil(context, ModalRoute.withName('/home')),

      ),
      backgroundColor: Colors.white,
      title: Container(child: Text("Sign In", style: TextStyle(color: Colors.black))),
    );
  }
}


