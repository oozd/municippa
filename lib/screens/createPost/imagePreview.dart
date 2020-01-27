import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';


import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:municippa/services/db.dart';

class ImagePreview extends StatefulWidget {


  final String location;
  final String title;
  final String post;
  final File image;

  const ImagePreview({Key key, this.location, this.title, this.post, this.image}) : super(key: key);



  @override
  _ImagePreviewState createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {

  final DbService _db = DbService();

  @override
  Widget build(BuildContext context) {

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('d MMM kk:mm').format(now);

    final user = Provider.of<FirebaseUser>(context);

    if(user == null){
      print("user is not signed in, Image Preview");

      return Scaffold(body: Center(child: Text("user is not signed in, Image Preview")));
    }

    else{
      return Scaffold(

          appBar: AppBar(
            title: Text(
              "Image Post Overview",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
            ),
            leading: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.white,
          ),

          body: GestureDetector(
            onTap: () {
              FocusScope.of(context)
                  .requestFocus(new FocusNode()); //tap outside takes focus out
            },
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 8,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    color: Colors.white,
                    child: Column(
                        children: <Widget>[
                          Expanded(
                            flex:18, // for top of the card vs button

                            child: Column(

                              children: <Widget>[

                                Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex:4, // for icon vs right side of it.
                                      child: FittedBox(
                                          child: Icon(Icons.account_circle, color: Colors.blue,)
                                      ),
                                    ),

                                    Expanded(
                                      flex: 30,
                                      child: Container(
                                        child: Text("Posted By ${user.displayName} "),
                                      ),
                                    ),

                                    Spacer(flex: 30),

                                    Expanded(
                                      flex: 18,
                                      child: Text(formattedDate)
                                    ),

                                  ],


                                ),

                                Row(
                                  children: <Widget>[

                                    Spacer(flex: 45),

                                    Expanded(
                                      flex:3, // for icon vs right side of it.
                                      child: FittedBox(
                                          child: Icon(Icons.location_on, color: Colors.blue,)
                                      ),
                                    ),

                                    Expanded(
                                      flex: 10,
                                      child: Container(
                                        child: Text("At ${widget.location} "),
                                      ),
                                    ),

                                  ],

                                ),


                                SizedBox(
                                  height: 10,
                                ),

                                Center(
                                    child: Text(
                                      widget.title,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold
                                      ),
                                    )
                                ),


                                SizedBox(
                                  height: 10,
                                ),

                                Expanded(flex:6, child: Image.file(widget.image)),

                                //Image.file(widget.image),


                                SizedBox(
                                  height: 10,
                                ),

                                Container(
                                  alignment: Alignment(-0.8, 0),
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: Text(widget.post, style: TextStyle(fontSize: 14),)),

                                SizedBox(
                                  height: 10,
                                ),


                              ],
                            ),
                          ),





                        ]
                    ),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                ButtonBar(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      //padding: EdgeInsets.fromLTRB(0, 100, 100, 100),
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      //height: 40,
                      child: ButtonTheme(
                        child: MaterialButton(
                          textColor: Colors.white,
                          color: Colors.redAccent,
                          child: Text("Back To Editting"),

                          onPressed: () {
                            Navigator.pop(context);

                          },
                        ),
                      ),
                    ),

                    Container(
                      //padding: EdgeInsets.fromLTRB(0, 100, 100, 100),
                      margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      //height: 40,
                      child: ButtonTheme(
                        child: MaterialButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text("All Is Well"),

                          onPressed: () async{

                            final user = Provider.of<FirebaseUser>(context, listen: false); // get the user here.

                            if(user != null) {
                              print("User ${user.displayName} Sending Image Post");
                              await _db.imageUpload(
                                image : widget.image,
                                user: user,
                                title: widget.title.trimRight(),
                                post: widget.post.trimRight(),
                                location: widget.location,
                              );


                            }

                            else{
                              print("Cannot Retrieve User at Image Preview");
                              Scaffold.of(context).showSnackBar( // if valid show a snackbar
                                  SnackBar(
                                    content: Row(
                                      children: <Widget>[
                                        CircularProgressIndicator(),
                                        Text("  Authentication Failed, Cannot Send Posts...")
                                      ],
                                    ),
                                  )
                              );
                            }




                          },
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(
                  height: 10,
                ),



              ],
            ),
          )

      );
    }



  }
}
