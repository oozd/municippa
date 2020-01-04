import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:municippa/screens/search/search.dart';
import 'package:municippa/services/sizeConfig.dart';


class HomeAppBar extends StatefulWidget implements PreferredSizeWidget{


  HomeAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight*0.8), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black) , onPressed: () => Scaffold.of(context).openDrawer()
        ),

        title: TextField(

          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: Search()));
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.black),
            hintText: "Search...",
          ),
        )
    );
  }
}
