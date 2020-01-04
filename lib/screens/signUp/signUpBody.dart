import 'package:flutter/material.dart';
import 'package:municippa/services/formValidators.dart';
import 'package:municippa/services/auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:municippa/screens/home/home.dart';




class SignUpBody extends StatefulWidget {
  @override
  _SignUpBodyState createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> { // TODO: app barı birleştir

  bool isRegistering = false;
  bool absorbing = false;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String name = "";
  String surname = "";
  String identity = "";
  String dropDown = "Choose...";
  String email = "";
  String password = "";
  String passwordRepeat = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController identityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRepeatController = TextEditingController();
  TextEditingController dropDownController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nameController.dispose();
    surnameController.dispose();
    identityController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordRepeatController.dispose();
    dropDownController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    print(absorbing);

    return AbsorbPointer(
      absorbing: absorbing,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());//tap outside takes focus out
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Center(
                    child: Column(
                      children: <Widget>[

                        Center( // Logo
                          child: SizedBox(
                            width: 120,
                            height: 120,
                            child: Image.asset('packages/municippa/assets/images/logo.png'),
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),
/*
                        TextFormField( // Name
                          controller: nameController,
                          validator: nameValidator,
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Name",
                              hintText: "Name",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.green,
                                      style: BorderStyle.solid))),
                        ),

                        SizedBox(
                          height: 10,
                        ),


                        TextFormField( // Surname
                          controller: surnameController,
                          validator: surnameValidator,
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Surname",
                              hintText: "Surname",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.green,
                                      style: BorderStyle.solid)
                              )
                          ),
                        ),

                        SizedBox(
                          height:10,
                        ),



                        TextFormField( // Identity Field
                          controller: identityController,
                          validator: identityValidator,
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              labelText: "Id",
                              hintText: "Id",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.green,
                                      style: BorderStyle.solid))),
                        ),

                        SizedBox(
                          height: 10,
                        ),
*/
                        TextFormField( // Email Address
                          controller: emailController,
                          //validator: emailValidator,
                          autofocus: false,
                          obscureText: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              labelText: "Email",
                              hintText: "Email",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.green,
                                      style: BorderStyle.solid))),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        TextFormField( // Password
                          controller: passwordController,
                          //validator: passwordValidator,
                          autofocus: false,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Password",
                              hintText: "Password",
                              //errorText: _validate ? 'Value Can\'t Be Empty' : null,
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.green,
                                      style: BorderStyle.solid))),
                        ),

                        SizedBox(
                          height: 10,
                        ),
/*
                        TextFormField( // Repeat Password
                          controller: passwordRepeatController,
                          validator: (value) {
                            if(value != passwordController.text){
                              return "Passwords do not match";
                            }
                            else if (value == ''){
                              return "Password is required";
                            }
                            else{
                              return null;
                            }
                          },
                          autofocus: false,
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              labelText: "Repeat Password",
                              hintText: "Repeat Password",
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.green,
                                      style: BorderStyle.solid))),
                        ),

                        SizedBox(
                          height: 10,
                        ),


                        ButtonTheme(
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

                        SizedBox(
                          height: 10,
                        ),
*/
                        ButtonTheme(
                          //elevation: 4,
                          //color: Colors.green,
                          //minWidth: ,
                          child: MaterialButton(
                            onPressed: () async {
                              if(_formKey.currentState.validate()){ //if form is valid send to firebase.

                                setState(() {
                                  absorbing = true;
                                });

                                isRegistering = true;

                                isRegistering ? Scaffold.of(context).showSnackBar( // if valid show a snackbar
                                    SnackBar(content:
                                    Row(
                                      children: <Widget>[
                                        CircularProgressIndicator(),
                                        Text("  Registering...")
                                      ],
                                    ),
                                    ))
                                    :
                                null;

                                dynamic user = await _auth.registerWithEmailAndPassword(
                                    name : nameController.text,
                                    surname : surnameController.text,
                                    identity : identityController.text,
                                    location : dropDown,
                                    email : emailController.text,
                                    password : passwordController.text,
                                ).whenComplete(
                                    () {
                                      setState(() {
                                        isRegistering = false;
                                        absorbing = false;
                                      });
                                    }
                                );

                                if(user == null){
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text("Registration Failed"),
                                  ));
                                }
                                else{
                                  Scaffold.of(context).showSnackBar(SnackBar(duration: Duration(seconds: 1),
                                    content: Text("Registered ${user.displayName} Successfully "),
                                  ));
                                  Navigator.popUntil(context, ModalRoute.withName('/home'));

                                }
                              }

                              else{ // Form is not validated
                                print("notValidated Sign Up Form");
                              }
                            },
                            textColor: Colors.white,
                            color: Colors.green,
                            height: 30,
                            child: Text("Sign Up"),
                          ),
                        )


                      ],
                    ),
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}
