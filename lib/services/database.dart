import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String uid;
  DatabaseService({this.uid});
  //collection reference
  final CollectionReference userCollection = Firestore.instance.collection('User');


  Future updateUserData(String name, String lastname, String email) async{

    return await userCollection.document(uid).setData({
      'name': name,
      'lastname': lastname,
      'email': email
    });

  }
}