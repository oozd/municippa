import 'package:flutter/material.dart';
import 'package:municippa/customizers/mainCustomizer.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    // TODO: Imagepicker
    return mainCustomizer("createPost", context);
  }
}
