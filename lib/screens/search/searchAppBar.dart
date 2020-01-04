import 'package:flutter/material.dart';
import 'package:municippa/customizers/mainCustomizer.dart';


class SearchAppBar extends StatefulWidget implements PreferredSizeWidget{


  SearchAppBar({Key key}) : preferredSize = Size.fromHeight(kToolbarHeight*0.8), super(key: key);

  @override
  final Size preferredSize; // default is 56.0



  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {

  bool secondClick = false;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,

        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black) , onPressed: () {
              if(secondClick){
                Navigator.pop(context);
              }
              else{
                secondClick = true;
                FocusScope.of(context).requestFocus(new FocusNode());
              }
            }

        ),

        title: TextField(
          autofocus: true,
          //onChanged: Do Stuff here.
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: Colors.black),
            hintText: "Search App Bar...",
          ),

        )
    );
  }
}
