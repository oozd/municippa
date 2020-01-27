import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';

class DbService{



  imageUpload(File imageFile) async {

    var uuid = Uuid();

    var imageId = uuid.v1();

    try {
      final StorageReference storageReference = FirebaseStorage().ref().child('imagePosts/' + imageId);

      final StorageUploadTask uploadTask = storageReference.putFile(imageFile);

      //TODO: write also to user profile also to posts collection

      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

      taskSnapshot.ref.getDownloadURL().then( (downloadURL) {
        print("Image Uploaded successfully");
      });



    } on Exception catch (e) {
      print("Error Uploading image File ${e.toString()}");
    }

  }
}