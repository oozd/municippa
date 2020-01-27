import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:municippa/services/auth.dart';

class DbService{



  imageUpload({File image, FirebaseUser user, String title, String post, String location}) async {

    var uuid = Uuid(); // create random Id instance

    var imageId = uuid.v1(); // get a random Id for imagePost

    try {

      final StorageReference storageReference = FirebaseStorage().ref().child('imagePosts/' + imageId); // create

      final StorageUploadTask uploadTask = storageReference.putFile(image);

      //TODO: write also to user profile also to posts collection

      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

      taskSnapshot.ref.getDownloadURL().then((downloadURL) {
        print("Image Uploaded successfully");
      });

      Firestore.instance.collection('posts').document(imageId).setData({
        'userId': user.uid,
        'user' : user.displayName,
        'title' : title,
        'post' : post,
        'location': location,
        'postDate' : DateTime.now(),
        'upVote' : 1,
        'downVote' : 0,
        'absVote' : 0,
        'votedBy' : [user.uid], // list of users who voted the post.

      });

      print("Post is written to posts collection");

      var userCollectionRef = Firestore.instance.collection("users").document(user.uid);


      var list = List<String>();
      list.add(imageId);

      userCollectionRef.updateData({
        'posts' : FieldValue.arrayUnion(list),
      });

      userCollectionRef.collection("votes").document(imageId).setData({
      'vote' : 1,
      });



      print("Users document is updated successfully");






    } on Exception catch (e) {
      print("Error Uploading image File ${e.toString()}");
    }

  }


}