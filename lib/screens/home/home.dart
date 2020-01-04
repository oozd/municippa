import 'package:flutter/material.dart';
import 'package:municippa/customizers/mainCustomizer.dart';
import 'package:municippa/services/sizeConfig.dart';


// Bottom navigation bar acts different according to the users auth state.
// Check auth state at  onclick method or on build method?

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); // For different phone sizes
    return mainCustomizer("home", context);
  }
}

