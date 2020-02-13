import 'package:flutter/material.dart';
import 'package:municippa/services/size_config.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:municippa/screens/home/home_app_bar.dart';
import 'package:municippa/screens/home/home_body.dart';
import 'package:municippa/screens/home/home_drawer_auth.dart';
import 'package:municippa/screens/home/home_drawer_unauth.dart';
import 'package:municippa/screens/home/home_bottom_navigation_bar.dart';


// Bottom navigation bar acts different according to the users auth state.
// Check auth state at  onclick method or on build method?

class Home extends StatelessWidget {

  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser>(context); // get the user here.

    if(user != null) {
      print("at home, user Display Name: ${user.displayName}");
      loggedIn = true;
    }

    else{
      loggedIn = false;
      print("NO USER");
    }

    SizeConfig().init(context); // For different phone sizes
    return DefaultTabController(
        length: 3,
        child: Scaffold(

          appBar: HomeAppBar(),


          body: HomeBody(),


          drawer: loggedIn ? HomeDrawerAuth() : HomeDrawerUnauth(),


          bottomNavigationBar: HomeBottomNavigationBar(),


        )
    );
  }
}

