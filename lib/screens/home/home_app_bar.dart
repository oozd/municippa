import 'package:flutter/material.dart';
import 'package:municippa/screens/search/search.dart';
import 'package:municippa/services/size_config.dart';



class HomeAppBar extends StatefulWidget implements PreferredSizeWidget{


  HomeAppBar({Key key}) : preferredSize = Size.fromHeight(SizeConfig.blockSizeVertical * 12), super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    //FocusScope.of(context).requestFocus(new FocusNode());
    return SafeArea(
      child: Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FittedBox(
              child: IconButton(
                  icon: Icon(Icons.account_circle, color: Colors.blue) , onPressed: () => Scaffold.of(context).openDrawer()
              ),
            ),
          ),

          Flexible(
            flex: 7,
            child: Container(
              child: TextField(
                autofocus: false,
                //textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                ),
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.push(this.context, MaterialPageRoute(builder: (context) => Search()));

                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintText: "Search...",
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
