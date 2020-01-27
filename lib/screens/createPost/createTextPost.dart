import 'package:flutter/material.dart';
import 'package:municippa/services/formValidators.dart';
import 'package:municippa/screens/createPost/textPreview.dart';

class CreateTextPost extends StatefulWidget {
  @override
  _CreateTextPostState createState() => _CreateTextPostState();
}

class _CreateTextPostState extends State<CreateTextPost> {
  final _formKey = GlobalKey<FormState>();

  String dropDown = "Choose an Area...";

  TextEditingController dropDownController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController postController = TextEditingController();

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
        appBar: AppBar(
          title: Text(
            "Creating Text Post",
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
                Flexible(
                  flex:1,
                  child: ButtonTheme(
                    child: MaterialButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      height: 30,
                      child: Text("See The Overview"),

                      onPressed: () {
                        if(_formKey.currentState.validate()){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TextPreview(
                            dropDown : dropDown,
                            title: titleController.text,
                            post: postController.text,
                          )));

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
