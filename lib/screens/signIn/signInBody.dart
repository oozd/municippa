import 'package:flutter/material.dart';
import 'package:municippa/services/formValidators.dart';
import 'package:municippa/services/auth.dart';

class SignInBody extends StatefulWidget {

  final Function() notifyParent;
  SignInBody({Key key, @required this.notifyParent}) : super(key: key);

  @override
  _SignInBodyState createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {

  bool isSigning = false;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

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
                      validator: (val) => emailValidator(val.trimRight()),
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
                      validator: passwordValidator,
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
                      child: MaterialButton(
                        textColor: Colors.white,
                        color: Colors.green,
                        height: 30,
                        child: Text("Sign In"),

                        onPressed: () async {
                          if(_formKey.currentState.validate()){ //if form is valid send to firebase.
                            print("validated Sign In Form");
                            widget.notifyParent();

                            isSigning = true;

                            isSigning ? Scaffold.of(context).showSnackBar( // if valid show a snackbar
                                SnackBar(
                                  content: Row(
                                    children: <Widget>[
                                      CircularProgressIndicator(),
                                      Text("  Signing In...")
                                    ],
                                  ),
                                )
                            )
                                :
                            null;


                            dynamic user = await _auth.signInWithEmailAndPassword(
                              email : emailController.text.trimRight(),
                              password : passwordController.text,
                            );

                            showSnackBar(user);




                          }
                          else{
                            print("notValidated Sign In Form");
                          }
                        },

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

  void showSnackBar(user) async {


    await Future.delayed(const Duration(seconds: 1), (){});


    print("user in SignIn: $user");
    if(user == null){
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Signing In Failed"),
        duration: Duration(seconds: 2),
      ));


      widget.notifyParent();
      setState(() {
        isSigning = false;
      });

    }
    else{
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Signed In ${user.displayName} Successfully "),
        duration: Duration(seconds: 2),
      ));


      await Future.delayed(const Duration(seconds: 3), (){});

      widget.notifyParent();
      setState(() {
        isSigning = false;
      });

      await Future.delayed(const Duration(seconds: 1), (){});

      Navigator.popUntil(context, ModalRoute.withName('/home'));

    }



  }
}
