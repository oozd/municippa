import 'package:flutter/material.dart';
import 'package:municippa/screens/createPost/image_preview.dart';

import 'package:municippa/services/form_validators.dart';

import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CreateImagePost extends StatefulWidget {
  @override
  _CreateImagePostState createState() => _CreateImagePostState();
}

class _CreateImagePostState extends State<CreateImagePost> {




  bool preview = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String dropDown = "Choose an Area...";

  TextEditingController dropDownController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController postController = TextEditingController();

  File _image;

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  Future getImageFromGallery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    dropDownController.dispose();
    titleController.dispose();
    postController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(

          title: Text(
            "Creating Image Post",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),

          leading: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),

          backgroundColor: Colors.white,
        ),

        body: GestureDetector( // if all is valid show the preview of the post
            onTap: () {
              FocusScope.of(context).requestFocus(new FocusNode());//tap outside takes focus out
              //there is a tab bug. Issue is still open at github. not a big problem.
            },
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                ButtonTheme(
                  alignedDropdown: true,
                  focusColor: Colors.blue,
                  child: DropdownButtonFormField<String>(
                    // Drop Down Form
                    validator: (value) {
                      if (value == 'Choose an Area...') {
                        return "Please Choose a Location";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on, color: Colors.blue),
                      hintText: "Choose an Area",
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                    ),
                    value: dropDown,

                    onChanged: (String newValue) {
                      setState(() {
                        FocusScope.of(context).requestFocus(new FocusNode());
                        dropDown = newValue;
                      });
                    },
                    items: <String>[
                      'Choose an Area...',
                      'Area A',
                      'Area B',
                      'Area C',
                      'Area D',
                      'Area E',
                      'Area F',
                      'Area G',
                      'Area H'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                TextFormField(
                  validator: titleValidator,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 2,
                  controller: titleController,
                  autofocus: false,
                  obscureText: false,
                  maxLength: 100,
                  decoration: InputDecoration(
                    hintText: "Enter an Interesting Title",
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 20.0),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                TextFormField(
                  validator: postValidator,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 5,
                  controller: postController,
                  autofocus: false,
                  obscureText: false,
                  maxLength: 1000,
                  decoration: InputDecoration(
                    hintText: "Enter Your Problem",
                    contentPadding: new EdgeInsets.symmetric(
                        vertical: 25.0, horizontal: 20.0),
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                SizedBox(
                  height: 30,
                ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: FlatButton(
                        child: Column(
                          children: <Widget>[

                            Icon(
                                Icons.photo_camera,
                                color: Colors.blueGrey,
                                size: 60
                            ),

                            Text(
                              "Take a Photograph",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )

                          ],
                        ),
                        onPressed: () {
                          getImageFromCamera();
                        },
                      ),
                    ),

                    Flexible(
                      flex: 1,
                      child: SizedBox(

                      ),
                    ),

                    Flexible(
                      flex: 3,
                      child: FlatButton(
                        child: Column(
                          children: <Widget>[

                            Icon(
                                Icons.photo_library,
                                color: Colors.blueGrey,
                                size: 60
                            ),

                            Text(
                              "Choose From Gallery",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            )

                          ],
                        ),
                        onPressed: () {
                          getImageFromGallery();
                        },
                      ),
                    ),

                  ],
                ),

                SizedBox(
                  height: 60,
                ),



                Flexible(
                  flex: 1,

                  child: ButtonTheme(
                    child: MaterialButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text("Send The Post"),

                      onPressed: () {
                        if(_formKey.currentState.validate() && _image != null){
                         print( "form validated and there is a picture");

                         Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePreview(
                           location : dropDown,
                           title: titleController.text,
                           post: postController.text,
                           image: _image,
                         )));


                        }

                        else if(_image == null){
                          final snackBar = SnackBar(content: Text("Please Choose an Image"));
                          _scaffoldKey.currentState.showSnackBar(snackBar);
                        }

                        else{
                          final snackBar = SnackBar(content: Text("Form is Not Validated"));
                          _scaffoldKey.currentState.showSnackBar(snackBar);

                        }

                      },

                    ),
                  ),
                )
              ]
              ),
            )
        )
    );
  }
}
