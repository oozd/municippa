import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<FirebaseUser> get user { // It will be a User or Null
    return _auth.onAuthStateChanged;
  }

  // Sign In Anon
  Future signInWithEmailAndPassword({String email, String password}) async {

    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user;
    }
    on Exception catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Register with email and password

  Future registerWithEmailAndPassword({String name, String surname, String identity, String location, String email, String password}) async {
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = name + ' ' + surname;


      Firestore.instance.collection('users').document(user.uid).setData({
        'name': name + ' ' + surname,
        'email': user.email,
        'registerDate' : DateTime.now(),
        'isEmailVerified': user.isEmailVerified,// TODO: Email Verification
        'location': location,
        'photoUrl': user.photoUrl,
      });

      try {
        await user.updateProfile(updateInfo);
      } on Exception catch (e) {
        print(e.toString());
        return null;
      }

      try {
        await user.reload();
      } on Exception catch (e) {
        print(e.toString());
        return null;
      }

      user = await _auth.currentUser();
      return user;

    } catch(e){
      print(e.toString());
      return null;
    }

  }


  // Sign Out
  Future signOut() async{
    try{
      print("Signing Out");
      return await _auth.signOut();
    }
    catch(e){
      print(e.toString());
      print("Problem With SignOut");
      return null;
    }

  }

}