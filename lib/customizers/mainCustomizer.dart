import 'package:flutter/material.dart';
import 'package:municippa/customizers/appBarCustomizer.dart';
import 'package:municippa/customizers/bodyCustomizer.dart';
import 'package:municippa/customizers/drawerCustomizer.dart';
import 'package:municippa/customizers/bottomNavigationBarCustomizer.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

/*Return Tab Bar or search page according to whichPage*/


Widget mainCustomizer(String whichPage, BuildContext context) {


  final user = Provider.of<FirebaseUser>(context);

  if(whichPage == "home"){ // Do i need 3 cases for all tabs.
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarCustomizer("home", context),
          body: bodyCustomizer("home", context),
          drawer: drawerCustomizer("home", context),
          bottomNavigationBar: bottomNavigationBarCustomizer("home", context),
        )
    );
  }

  else if(whichPage == "search"){
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBarCustomizer("search", context),
          body: bodyCustomizer("search", context),
          drawer: null,
          bottomNavigationBar: null,
        )
    );
  }

  else if(whichPage == "createPost"){
    //TODO: Check the auth state at the beginning and pass value to customizers according to the auth value.
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          //TODO: Also fill the below stuff.
          //appBar: appBarCustomizer("search", context),
          body: bodyCustomizer("createPost", context),
          //drawer: null,
          //bottomNavigationBar: null,
        )
    );
  }

  else if(whichPage == "signIn"){
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarCustomizer("signIn", context),
        body: bodyCustomizer("signIn", context),
      ),
    );
  }

  else if(whichPage == "signUp"){
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBarCustomizer("signUp", context),
        body: bodyCustomizer("signUp", context),
      ),
    );
  }


  return Center(
      child: Text("Page Customizer Didn't Get Call Correctly")
  );
}


