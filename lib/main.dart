import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:municippa/services/auth.dart';

import 'package:municippa/screens/home/home.dart';
import 'package:municippa/screens/search/search.dart';
import 'package:municippa/screens/signUp/signUp.dart';
import 'package:municippa/screens/signIn/signIn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
    value: AuthService().user,
      child: MaterialApp(

        routes: {
        '/home': (context) => Home(),
        '/search': (context) => Search(),
        '/signup': (context) => SignUp(),
        '/signin': (context) => SignIn(),

        },
        initialRoute: '/home',
      ),
    );
  }
}

