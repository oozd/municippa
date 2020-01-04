import 'package:flutter/material.dart';
import 'package:municippa/services/formValidators.dart';

class SignInBody extends StatefulWidget {

  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {

  String email = "";
  String password = "";

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final _formKey = GlobalKey<FormState>();

    return GestureDetector(
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

                    Center(
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset('packages/municippa/assets/images/logo.png'),
                      ),
                    ),

                    SizedBox(
                      height:20,
                    ),

                    TextFormField(
                      controller: emailController,
                      validator: emailValidator,
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

                    TextFormField(
                      controller: passwordController,
                      validator: nameValidator,
                      autofocus: false,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: "Password",
                          hintText: "Password",
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
                      height: 15,
                    ),

                    ButtonTheme(
                      //elevation: 4,
                      //color: Colors.green,
                      //minWidth: ,
                      child: MaterialButton(
                        onPressed: () async {
                          if(_formKey.currentState.validate()){ //if form is valid send to firebase.
                            print("validated Sign In Form");
                          }
                          else{
                            print("notValidated Sign In Form");
                          }
                        },
                        textColor: Colors.white,
                        color: Colors.green,
                        height: 30,
                        child: Text("Sign In"),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
