import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:municippa/screens/search/search_app_bar.dart';
import 'package:municippa/screens/search/search_body.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser>(context); // get the user here. Probably not important in search page.

    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: SearchAppBar(),
          body: SearchBody(),
          //drawer: drawerCustomizer("home", context),
          //bottomNavigationBar: bottomNavigationBarCustomizer("home", context),
        )
    );
  }
}

