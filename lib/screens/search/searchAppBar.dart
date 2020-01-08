import 'package:flutter/material.dart';
import 'package:municippa/customizers/mainCustomizer.dart';
import 'package:municippa/services/sizeConfig.dart';


class SearchAppBar extends StatefulWidget implements PreferredSizeWidget{


  SearchAppBar({Key key}) : preferredSize = Size.fromHeight(SizeConfig.blockSizeVertical * 12), super(key: key);

  @override
  final Size preferredSize; // default is 56.0



  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBar> {

  bool secondClick = false;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Row(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            flex: 1,
            child: FittedBox(
              child: IconButton(
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
            ),
          ),

          Flexible(
            flex: 7,
            child: Container(
              child: TextField(
                onTap: () {
                  secondClick = false;
                },
                autofocus: true,
                textAlignVertical: TextAlignVertical.center,
                style: TextStyle(
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                  hintText: "Search App Bar...",
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
