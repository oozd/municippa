import 'package:flutter/material.dart';
import 'package:municippa/customizers/mainCustomizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return mainCustomizer("signIn", context);
  }
}