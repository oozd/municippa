import 'package:flutter/material.dart';

class AccountSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Icon(Icons.arrow_back, color: Colors.black,),
        title: Text("Account Settings"),
      ),
      body: Center(
        child: Text(
          "Account Settings"
        ),
      ),
    );
  }
}
