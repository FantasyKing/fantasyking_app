import 'package:firebase_auth/firebase_auth.dart';
import 'package:eishockey_fantasy_app/models/user.dart';
import 'package:eishockey_fantasy_app/services/database.dart';


class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  Future<User> _userFromFirebaseUser(FirebaseUser user) async{

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

      // create a nwe doc
      await DatabaseService(uid: user.uid).updateUserData('test', 'test', 'test');

      if(user.uid != null){
        initialRegisterUser(user.uid);
      }

      return user.uid;


    }catch(e){
      print(e.toString());
      return null;
    }
  }

  Future initialRegisterUser(String userID)async {
    await DatabaseService(uid: userID).updateUserData('test', 'test', 'test');
    return userID;

  }
// register with email and password
}