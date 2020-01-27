import 'package:flutter/material.dart';

class TextPreview extends StatefulWidget {

  final String dropDown;
  final String title;
  final String post;

  const TextPreview({Key key, this.dropDown, this.title, this.post}) : super(key: key);

  @override
  _TextPreviewState createState() => _TextPreviewState();
}

class _TextPreviewState extends State<TextPreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Text Post Overview",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
        ),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
      ),

      body: Center(
        child: Text(widget.dropDown),
      )
    );
  }
}
