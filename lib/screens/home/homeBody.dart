import 'package:flutter/material.dart';
import 'package:municippa/screens/popular/popular.dart';
import 'package:municippa/screens/recent/recent.dart';
import 'package:municippa/screens/nearMe/nearMe.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:municippa/services/sizeConfig.dart';

class HomeBody extends StatefulWidget {
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {

  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<FirebaseUser>(context);

    if(user != null){
      print("at home body ${user.email}");
      loggedIn = true;
    }
    else{
      loggedIn = false;
    }


    return Column(
      children: <Widget>[
        TabBar(
          tabs: [
            Tab(text: "Popular"),
            Tab(text: "Recent" ),
            Tab(text: "Near Me"),
          ],
          labelColor: Colors.black,

        ),
        Expanded(
          flex: 1,
          child: TabBarView(
            children: [
              Popular(),
              Recent(),
              NearMe(),
            ],
          ),
        )
      ],
    );
  }
}