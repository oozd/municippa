import 'package:flutter/material.dart';
import 'package:municippa/services/db.dart';

class NearMeBody extends StatefulWidget {
  @override
  _NearMeBodyState createState() => _NearMeBodyState();
}

//TODO: for nearme get the user's location at provider. Create a user class maybe if there are too many fields.

class _NearMeBodyState extends State<NearMeBody> {

  final DbService _db = DbService();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: <Widget>[


        ],
      ),
    );
  }
}