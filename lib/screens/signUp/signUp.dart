import 'package:flutter/material.dart';
import 'package:municippa/customizers/mainCustomizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return mainCustomizer("signUp", context);
  }
}