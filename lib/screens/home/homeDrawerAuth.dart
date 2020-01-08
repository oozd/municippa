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
      width:  MediaQuery.of(context).size.width*.60,
      child: Drawer(
        child: Column(
          // Important: Remove any padding from the ListView.
          //padding: EdgeInsets.zero,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width:  MediaQuery.of(context).size.width*.60,
                child: DrawerHeader(
                  child: Column(
                      children: <Widget>[
                        Flexible(
                          flex: 7,
                          child: Center(
                            child: SizedBox(
                              child: Image.asset('packages/municippa/assets/images/logo.png'),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 50,
                        ),

                        Flexible(
                          flex: 1,
                          child: SizedBox(
                            child: Text("Welcome Message", style: TextStyle(fontSize: 12))),
                        ),
                        // TODO: Pass user name to welcome message.

                      ]
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ),


            Expanded(
                flex:2,
                child: ListView(
                  children: <Widget>[
                    ListTile(
                      title: Text('Home Page'),
                      onTap: () {
                        // Update the state of the app
                        // ...
                        // Then close the drawer
                        Navigator.pop(context);
                      },
                    ),

                    SizedBox(
                      height: 10,
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

                    SizedBox(
                      height: 10,
                    ),

                    ListTile(
                      title: Text('Sign Out'),
                      onTap: () async {
                        await _auth.signOut(); // Sign out by using the created auth instance
                      },
                    ),

                  ],
                )
            )

          ],
        ),
      ),
    );
  }

}