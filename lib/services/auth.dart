import 'package:firebase_auth/firebase_auth.dart';
import 'package:eishockey_fantasy_app/models/user.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){

    return user != null ? User(uid: user.uid) : null;

  }

  //sing in email & password
  Future signInEmailPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);

    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future registerInEmailPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return user.uid;

    }catch(e){
      print(e.toString());
      return null;
    }
  }
// register with email and password
}