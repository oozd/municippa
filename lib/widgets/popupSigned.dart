import 'package:flutter/material.dart';
import 'package:municippa/popup_menu.dart';
import 'package:municippa/screens/signUp/signUp.dart';
import 'package:municippa/screens/signIn/signIn.dart';

//TODO: change to signed version.


_onClick(MenuItemProvider item){
  if(item.menuTitle == "Take a Picture"){
    Navigator.push(PopupMenu.context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  else if(item.menuTitle == "Write About Something"){
    Navigator.push(PopupMenu.context, MaterialPageRoute(builder: (context) => SignIn()));
  }
}


PopupMenu authMenu = PopupMenu(
  items: [
    MenuItem(title: "Take a Picture",
        textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12)
    ),
    MenuItem(title: "Write About Something",
        textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12)
    ),
  ],
  onClickMenu: _onClick,
);


