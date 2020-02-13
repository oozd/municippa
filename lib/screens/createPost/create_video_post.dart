import 'package:flutter/material.dart';

class CreateVideoPost extends StatefulWidget {
  @override
  _CreateVideoPostState createState() => _CreateVideoPostState();
}

class _CreateVideoPostState extends State<CreateVideoPost> {

  String dropDown = "Choose...";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Creating Video Post", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),
      body: ButtonTheme(
        alignedDropdown: true,
        focusColor: Colors.blue,
        child: DropdownButtonFormField<String>(// Drop Down Form
          validator: (value) {
            if(value == 'Choose...'){
              return "Please Choose a Location";
            }
            else{
              return null;
            }
          },
          itemHeight: 50,
          decoration: InputDecoration(
              labelText: "Area",
              hintText: "Choose an Area",
              labelStyle: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),

              border: OutlineInputBorder(
                //borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide(
                      width: 1,
                      color: Colors.green,
                      style: BorderStyle.solid)
              )
          ),
          value: dropDown,

          onChanged: (String newValue) {
            setState(() {
              FocusScope.of(context).requestFocus(new FocusNode());
              dropDown = newValue;
            });
          },
          items: <String>['Choose...', 'Area A', 'Area B', 'Area C', 'Area D', 'Area E', 'Area F', 'Area G', 'Area H']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),

    );
  }
}
