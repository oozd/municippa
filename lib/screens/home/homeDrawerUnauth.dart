import 'package:flutter/material.dart';
import 'package:municippa/services/sizeConfig.dart';

/* TODO: Should act different according to the authentication.*/


class HomeDrawerUnauth extends StatefulWidget {
  @override
  _HomeDrawerUnauthState createState() => _HomeDrawerUnauthState();
}

class _HomeDrawerUnauthState extends State<HomeDrawerUnauth> {
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

                    SizedBox(child: Text("Please Sign In", style: TextStyle(fontSize: 12))),
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
              title: Text('Sign In'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/signin');
                //Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Sign Up'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pushNamed(context, '/signup');
                //Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
