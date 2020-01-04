import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:municippa/screens/home/homeAppBar.dart';
import 'package:municippa/screens/search/searchAppBar.dart';
import 'package:municippa/screens/signIn/signInAppBar.dart';
import 'package:municippa/screens/signUp/signUpAppBar.dart';


Widget appBarCustomizer(String whichPage, BuildContext context) {

  final user = Provider.of<FirebaseUser>(context);


  if (whichPage == "home") { // Do i need 3 cases for all tabs.
    return HomeAppBar();
  }

  else if (whichPage == "search") {
    return SearchAppBar();
  }

  else if (whichPage == "signIn"){
    return SignInAppBar();
  }

  else if (whichPage == "signUp"){
    return SignUpAppBar();
  }

  return Center(
    child: Text("App Bar Didn't Get Call Correctly")
  );
}