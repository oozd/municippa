import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:municippa/screens/home/homeBody.dart';
import 'package:municippa/screens/search/searchBody.dart';
import 'package:municippa/screens/createPost/createPostAuthBody.dart';
import 'package:municippa/screens/signIn/signInBody.dart';
import 'package:municippa/screens/signUp/signUpBody.dart';

/*Return Tab Bar or search page according to whichPage*/


Widget bodyCustomizer(String whichPage, BuildContext context) {

  final user = Provider.of<FirebaseUser>(context);

    if(whichPage == "home"){ // Do i need 3 cases for all tabs.
      return HomeBody();
    }

    else if(whichPage == "search"){
      return SearchBody();
  }

    else if(whichPage == "createPost"){
      return CreatePostAuthBody();
    }

    else if(whichPage == "signIn"){
      return SignInBody();
    }

    else if(whichPage == "signUp"){
      return SignUpBody();
    }

    return Center(
        child: Text("Body Customizer Didn't Get Call Correctly")
    );
}


