import 'package:flutter/material.dart';
import 'package:municippa/services/size_config.dart';

/* TODO: Should act different according to the authentication.*/


class HomeDrawerUnauth extends StatefulWidget {
  @override
  _HomeDrawerUnauthState createState() => _HomeDrawerUnauthState();
}

class _HomeDrawerUnauthState extends State<HomeDrawerUnauth> {
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
                              child: Text("Please Sign In", style: TextStyle(fontSize: 14))),
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
                  title: Text('Home Page', style: TextStyle(fontSize: 14)),
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
                  title: Text('Sign In', style: TextStyle(fontSize: 14)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pushNamed(context, '/signin');
                    //Navigator.pop(context);
                  },
                ),

                SizedBox(
                  height: 10,
                ),

                ListTile(
                  title: Text('Sign Up', style: TextStyle(fontSize: 14)),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pushNamed(context, '/signup');
                    //Navigator.pop(context);
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
