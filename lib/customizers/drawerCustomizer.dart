import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:municippa/screens/home/homeDrawerAuth.dart';
import 'package:municippa/screens/home/homeDrawerUnauth.dart';

// TODO: Add an auth flag and design it according to that.



Widget drawerCustomizer(String whichPage, BuildContext context) {

  if(whichPage == "home"){
    return HomeDrawerUnauth();
    // TODO: Split 2 cases here: HomeDrawerAuth and HomeDrawerUnauth
  }

  return Center(
      child: Text("Drawer Didn't Get Call Correctly")
  );
}


