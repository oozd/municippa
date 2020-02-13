import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';
import 'package:uuid/uuid.dart';
import 'package:municippa/posts/image_post.dart';
import 'package:municippa/services/auth.dart';
import 'package:flutter/material.dart';

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
        'title' : title,
        'post' : post,
        'location': location,
        'postDate' : DateTime.now(),
        'upVote' : 1,
        'downVote' : 0,
        'absVote' : 1,

      });

      print("Post is written to posts collection");

      var postCollectionRef = Firestore.instance.collection("posts").document(imageId);

      postCollectionRef.collection("votedBy").document(user.uid).setData({
        'vote' : 1,
      });

      print("User vote is added to votedBy subcollection");


      var userCollectionRef = Firestore.instance.collection("users").document(user.uid);

      userCollectionRef.collection("posts").document(imageId).setData({
        'exists' : true,
      });

      userCollectionRef.collection("votes").document(imageId).setData({
        'vote' : 1,
      });



      print("Users document is updated successfully");



    } on Exception catch (e) {
      print("Error Uploading image File ${e.toString()}");
    }

  }

  getRecentPosts(lastDoc, lim) async {

    var recentDocs;
    var query;
    List<ImagePost> recentPosts = [];

    try {
      var postCollectionRef = Firestore.instance.collection("posts");

      if (lastDoc != null) {
        query = postCollectionRef.orderBy("postDate",
            descending: true).startAfter([lastDoc["postDate"]]).limit(lim);
      }
      else {
        try {
          query = postCollectionRef.orderBy("postDate",
              descending: true).limit(lim);
        } on Exception catch (e) {
          print("Error Occured querying: ${e
              .toString()}");
          // TODO
        }
      }

      try {
        recentDocs = await query.getDocuments();//
      } on Exception catch (e) {
        print("Error Occured when getting documents: ${e
            .toString()}");
      }

      for (var doc in recentDocs.documents) {
        try {
          // Get the image
          final StorageReference storageReference = FirebaseStorage()
              .ref()
              .child('imagePosts/' + doc.documentID); // create
          String downloadURL = await storageReference.getDownloadURL();

          print("finish getting the imageURL");
          // Finish getting the imageURL

          var docData = doc.data;

          // Create an imagePost object

          var imagePost = ImagePost(
            docId: doc.documentID,
            userId: docData['userId'],
            title: docData['title'],
            post: docData['post'],
            location: docData['location'],
            postDate: docData['postDate'].toDate(),
            imageURL: downloadURL,
            //TODO: this will change for ios since its date format is different. Check Platform
            //Check Platform here.
            absVote: docData['absVote'],

          );

          print("imagePost Title: ${imagePost.title}");

          // Finish creating imagePost object

          print("finish creating the image post obj");


          recentPosts.add(imagePost);

          print("added obj to the list");

        } on Exception catch (e) {
          print("Error Occured when getting the image from firebase storage: ${e
              .toString()}");
        }
      }

      print("returning the list");

      if(recentPosts.isEmpty){ // reached to the last document.
        return [[], lastDoc];
      }
      else{
        return [recentPosts, recentDocs.documents[recentDocs.documents.length - 1] ]; // return the posts and lastDoc
      }



    } on Exception catch (e) {
      print("Error Getting Recent Posts, error: ${e.toString()} ");
    }
  }


}