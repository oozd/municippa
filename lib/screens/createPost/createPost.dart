import 'package:flutter/material.dart';
import 'package:municippa/screens/createPost/createPostAuthBody.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  @override
  Widget build(BuildContext context) {
    // TODO: Imagepicker
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          //TODO: Also fill the below stuff.
          //appBar: appBarCustomizer("search", context),
          body: CreatePostAuthBody(),
          //drawer: null,
          //bottomNavigationBar: null,
        )
    );
  }
}
