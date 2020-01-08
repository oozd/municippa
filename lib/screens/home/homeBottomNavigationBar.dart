import 'package:flutter/material.dart';
import 'package:municippa/popup_menu.dart';
import 'package:municippa/widgets/popupUnsigned.dart';
import 'package:municippa/widgets/popupSigned.dart';
import 'package:municippa/services/sizeConfig.dart';
import 'dart:ui' as ui;



class HomeBottomNavigationBar extends StatefulWidget {

  @override
  _HomeBottomNavigationBarState createState() => _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {

  int _selectedItem = 0;

  _onItemTapped(int index) {



    if(index == 1) {

      final ui.Size logicalSize = MediaQuery.of(context).size;
      final double _width = MediaQuery.of(context).size.width;
      final double _height = MediaQuery.of(context).size.height;
      double _rectHeight = MediaQuery.of(context).size.width*.12;
      double top =  _height - _rectHeight;
      double left = _width;

      Rect myRect = Rect.fromLTRB( left, top, 0.0, 0.0 );

      //TODO: according to the auth call authMenu or unauthMenu
      PopupMenu.context = context;
      unauthMenu.show(rect: myRect);
    }
  }

  @override
  Widget build(BuildContext context) {

    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      //onTap: _onItemTapped, // this will be set when a new tab is tapped
      onTap: _onItemTapped,
      selectedItemColor: Colors.lightBlue[900],
      unselectedItemColor: Colors.blue,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.minimize, color: Colors.white),title: Text('')),
        BottomNavigationBarItem( icon: Icon(Icons.create),title: Text('Create Post')),
        BottomNavigationBarItem(icon: Icon(Icons.minimize, color: Colors.white),title: Text('')),

      ],
      currentIndex: _selectedItem,
    );
  }
}