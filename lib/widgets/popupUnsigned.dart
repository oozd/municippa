import 'package:flutter/material.dart';
import 'package:municippa/popup_menu.dart';
import 'package:municippa/screens/signUp/signUp.dart';
import 'package:municippa/screens/signIn/signIn.dart';

_onClick(MenuItemProvider item){
  if(item.menuTitle == "Sign Up"){
    Navigator.pushNamed(PopupMenu.context, '/signup');
  }

  else if(item.menuTitle == "Sign In"){
    Navigator.pushNamed(PopupMenu.context, '/signin');
  }
}


PopupMenu unauthMenu = PopupMenu(
    items: [
      MenuItem(title: "Sign Up",
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          )
      ),
      MenuItem(title: 'Sign In',
          textStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          )
      ),
    ],
    onClickMenu: _onClick,
);



