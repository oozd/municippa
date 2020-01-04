import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:municippa/screens/home/homeBottomNavigationBar.dart';

// TODO: Add an auth flag and design it according to that.

Widget bottomNavigationBarCustomizer(String whichPage, BuildContext context) {

  final user = Provider.of<FirebaseUser>(context);

  if(whichPage == "home"){ // Do i need 3 cases for all tabs.
    return HomeBottomNavigationBar();
  }

  return Center(
      child: Text("Bottom Navigation Bar Didn't Get Call Correctly")
  );
}


