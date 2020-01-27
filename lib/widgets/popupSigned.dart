import 'package:flutter/material.dart';
import 'package:municippa/popup_menu.dart';
import 'package:municippa/screens/signIn/signIn.dart';
import 'package:municippa/screens/createPost/createImagePost.dart';
import 'package:municippa/screens/createPost/createTextPost.dart';
import 'package:municippa/screens/createPost/createVideoPost.dart';


_onClick(MenuItemProvider item){
  if(item.menuTitle == "Image Post"){
    Navigator.push(PopupMenu.context, MaterialPageRoute(builder: (context) => CreateImagePost()));
  }

  else if(item.menuTitle == "Text Post"){
    Navigator.push(PopupMenu.context, MaterialPageRoute(builder: (context) => CreateTextPost()));
  }

  /*
  TODO: After the release
  else if(item.menuTitle == "Video Post"){
    Navigator.push(PopupMenu.context, MaterialPageRoute(builder: (context) => CreateVideoPost()));
  }
  */
}


PopupMenu authMenu = PopupMenu(
  items: [
    MenuItem(title: "Image Post",
        textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14)
    ),

    MenuItem(title: "Text Post",
        textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 14)
    ),

   /* MenuItem(title: "Video Post",
        textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12)
    ),*/
  ],
  onClickMenu: _onClick,
);


