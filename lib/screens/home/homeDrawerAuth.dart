import 'package:flutter/material.dart';
import 'package:municippa/screens/account/accountSettings.dart';
import 'package:municippa/services/auth.dart';
import 'package:municippa/services/sizeConfig.dart';

/* TODO: Should act different according to the authentication.*/


class HomeDrawerAuth extends StatefulWidget {
  @override
  _HomeDrawerAuthState createState() => _HomeDrawerAuthState();
}

class _HomeDrawerAuthState extends State<HomeDrawerAuth> {

  final AuthService _auth = AuthService(); // create an authentication instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox( // to set the drawer's width
      width: 200,
      child: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[

            DrawerHeader(
              child: Column(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                      width: 90,
                      height: 90,
                      child: Image.asset('packages/municippa/assets/images/logo.png'),
                      ),
                  ),

                    SizedBox(
                      height:30,
                    ),

                    SizedBox(child: Text("Welcome Message", style: TextStyle(fontSize: 12))),
                    // TODO: Pass user name to welcome message.

                ]
              ),


              decoration: BoxDecoration(
                color: Colors.white,

              ),
            ),
            ListTile(
              title: Text('Home Page'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Account Settings'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer

                //Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Sign Out'),
              onTap: () async {
                await _auth.signOut(); // Sign out by using the created auth instance
              },
            ),
          ],
        ),
      ),
    );
  }
}
