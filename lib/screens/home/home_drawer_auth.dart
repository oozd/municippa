import 'package:flutter/material.dart';
import 'package:municippa/screens/account/account_settings.dart';
import 'package:municippa/services/auth.dart';
import 'package:municippa/services/size_config.dart';

/* TODO: Should act different according to the authentication.*/


class HomeDrawerAuth extends StatefulWidget {
  @override
  _HomeDrawerAuthState createState() => _HomeDrawerAuthState();
}

class _HomeDrawerAuthState extends State<HomeDrawerAuth> {


  bool isSigningOut = false;


  final AuthService _auth = AuthService(); // create an authentication instance;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isSigningOut,
      child: SizedBox( // to set the drawer's width
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

                            setState(() {
                              isSigningOut = true;
                            });



                            isSigningOut ? Scaffold.of(context).showSnackBar( // if valid show a snackbar
                                SnackBar(
                                  content: Row(
                                    children: <Widget>[
                                      CircularProgressIndicator(),
                                      Text("  Signing Out...")
                                    ],
                                  ),
                                )
                            )
                                :
                            null;


                            await _auth.signOut().whenComplete(
                                () async {


                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text(
                                        "Signed Out Successfully "
                                    ),
                                    duration: Duration(seconds: 1),
                                  ));

                                  await Future.delayed(const Duration(seconds: 4), (){});




                                  if(mounted){
                                    setState(() {
                                      isSigningOut = false;
                                    });
                                  }


                                  await Future.delayed(const Duration(seconds: 2), (){});

                                  Navigator.popUntil(context, ModalRoute.withName('/home'));

                                }
                            ); // Sign out by using the created auth instance

                          },


                        ),

                      ],
                    )
                )

              ],
            ),
          ),
      ),
    );
  }


}
