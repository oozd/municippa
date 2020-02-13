import 'package:flutter/material.dart';

class SignUpAppBar extends StatefulWidget implements PreferredSizeWidget{

  SignUpAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight*0.8), super(key: key);

  @override
  final Size preferredSize; // default is 56.0


  @override
  _SignUpAppBarState createState() => _SignUpAppBarState();
}

class _SignUpAppBarState extends State<SignUpAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      leading: IconButton(icon:Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed:() => Navigator.popUntil(context, ModalRoute.withName('/home')),
      ),
      backgroundColor: Colors.white,
      title: Container(child: Text("Sign Up", style: TextStyle(color: Colors.black))),
    );
  }
}
