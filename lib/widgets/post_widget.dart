import 'package:flutter/material.dart';
import 'package:municippa/posts/image_post.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostWidget extends StatelessWidget {
  final ImagePost imagePost;

  const PostWidget({Key key, @required this.imagePost}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      color: Colors.white,
      child: Column(
        children: <Widget>[

          Row(
            children: <Widget>[
              Expanded(
                flex:4, // for icon vs right side of it.
                child: FittedBox(
                    child: Icon(Icons.account_circle, color: Colors.blue,)
                ),
              ),

              Expanded(
                flex: 30,
                child: Container(
                  child: Text("Posted By "),
                ),
              ),

              Spacer(flex: 30),

              Expanded(
                  flex: 18,
                  child: Text("Date")
              ),

            ],


          ),

          Row(
            children: <Widget>[

              Spacer(flex: 45),

              Expanded(
                flex:3, // for icon vs right side of it.
                child: FittedBox(
                    child: Icon(Icons.location_on, color: Colors.blue,)
                ),
              ),

              Expanded(
                flex: 10,
                child: Container(
                  child: Text("At ${imagePost.location} "),
                ),
              ),

            ],

          ),


          SizedBox(
            height: 10,
          ),

          Center(
              child: Text(
                imagePost.title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              )
          ),


          SizedBox(
            height: 10,
          ),


          CachedNetworkImage(
            imageUrl: imagePost.imageURL,
            placeholder: (context, url) => Image.asset('packages/municippa/assets/images/blank.jpg', height: 800, width: 800),
          ),

          SizedBox(
            height: 10,
          ),

          Container(
              alignment: Alignment(-0.8, 0),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(imagePost.post, style: TextStyle(fontSize: 14),)),

          SizedBox(
            height: 10,
          ),


        ],
      ),
    );
  }
}